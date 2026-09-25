# graphics-playground

A small teaching project for learning modern GPU graphics with Rust, `wgpu`, `winit`, and WGSL.

The first example intentionally does only one thing: draw a colored triangle.

## Environment

This version assumes a normal Linux desktop environment with a working GPU driver and Vulkan/OpenGL stack. It contains no WSL-specific backend selection or Windows translation-layer setup.

A typical Linux path is:

```text
application
    ↓
wgpu
    ↓
Vulkan
    ↓
Mesa RADV / ANV or NVIDIA driver
    ↓
GPU
```

Before running the program, it is useful to verify that Linux can see the real GPU:

```bash
vulkaninfo --summary
```

The selected adapter printed by this program should also name the real GPU rather than a software renderer such as `llvmpipe`.

## Run

Install Rust, make sure the system GPU driver is working, then run:

```bash
cargo run
```

The program opens an 800×600 window and draws one RGB triangle on a dark blue background.

## What this example teaches

The code keeps the first rendering path deliberately small:

```text
winit Window
    ↓
wgpu Instance
    ↓
Surface
    ↓
Adapter
    ↓
Device + Queue
    ↓
Shader + RenderPipeline
    ↓
CommandEncoder
    ↓
RenderPass
    ↓
draw(0..3)
    ↓
Present
```

The three vertices are generated directly in the vertex shader using `vertex_index`. There is no vertex buffer yet. This keeps the example focused on the graphics pipeline itself.

The program is also event-driven rather than continuously redrawing. It renders once when the window is created and again when the window is resized, so an idle static triangle should consume very little CPU or GPU time.

## Files

- `src/main.rs`: window creation, GPU initialization, render pipeline, and frame submission.
- `src/shader.wgsl`: vertex and fragment shaders.
