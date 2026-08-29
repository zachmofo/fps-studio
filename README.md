# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-0**. Engine: **Godot 4.3** (GDScript, Compatibility / GL Compatibility renderer). Walk and look in one empty enclosed room.

## Requirements

- **Godot 4.3** (exact). Archive: https://godotengine.org/download/archive/4.3-stable/
- Do not open this project in Godot 3.x or 4.2. Compatibility renderer is already selected in `project.godot`.

## Clone / open

Repo: https://github.com/zachmofo/fps-studio  
Branch: `iter/I-0` (do not use `main` for this slice).

```
git clone -b iter/I-0 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

1. Install Godot 4.3.
2. In Godot 4.3 choose **Import** and open `project.godot` at the repo root (this file sits next to `STUDIO.md`).
3. Press **F5** (Play), or **Project → Run Project**. Main scene is `scenes/main.tscn`.
4. **Left-click** the game window to capture the mouse.
5. **WASD** walks relative to facing (~5 m/s). Mouse looks (yaw on the body, pitch on the camera). Pitch is clamped to about ±89°.
6. **Esc** (`ui_cancel`) releases the cursor.
7. **Quit:** close the game window, or **F8** (Stop) in the editor.

Default mouse sensitivity is `0.0025` radians per pixel (`mouse_sensitivity` export on the Player node). Raw relative mouse motion; no smoothing or acceleration.

## I-0 changelog

I-0 (2026-08-28) ships a bootable Godot 4.3 project named Iron Saint: a ~20×20 m enclosed room with collision on floor, walls, and ceiling; a visible spawn marker; and a first-person `CharacterBody3D` that walks with gravity (no jump) and raw mouse look (click to capture, Esc to release). Tickets I0-1 through I0-5. https://github.com/zachmofo/fps-studio branch `iter/I-0`.

## Known issues

- The cursor is visible until left-click in the game window; Esc only releases, it does not quit.
- No exported binary; run from the Godot 4.3 editor (F5).
- Capsule vs box corners can feel sticky; the room has no cover or props.
- Jump, sprint, shoot, HUD, enemy, and audio are out of I-0 scope (not missing features of this slice).
