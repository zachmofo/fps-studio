# Changelog

## I-0 — 2026-08-28

**Engine:** Godot 4.3 (GDScript, GL Compatibility)
**Repo URL:** https://github.com/zachmofo/fps-studio
**Branch:** `iter/I-0`
**Build ID:** I-0 (push SHA filled after push)

### Tickets

- **I0-1** Project skeleton — Godot 4.3 `project.godot` at repo root, `.gitignore` for `.godot/` and OS junk, `STUDIO.md` kept at root, branch `iter/I-0`. Remote https://github.com/zachmofo/fps-studio.
- **I0-2** Player controller — `CharacterBody3D`, InputMap actions `move_forward` / `move_back` / `move_left` / `move_right`, WASD via `Input.get_vector` relative to facing (basis, Y ignored), 5 m/s walk, gravity from ProjectSettings, no jump. Releasing WASD zeros xz velocity (no drift).
- **I0-3** Camera — yaw on the body, pitch on `Camera3D`, clamp ~±89°, raw `InputEventMouseMotion.relative`, no smoothing/accel. Left-click captures (`MOUSE_MODE_CAPTURED`); Esc (`ui_cancel`) releases (`MOUSE_MODE_VISIBLE`). Default sensitivity `0.0025` rad/pixel (export).
- **I0-4** Empty arena — one enclosed room, interior ~20×20 m, floor at y=0, walls 4 m high, ceiling included. `StaticBody3D` + `BoxShape3D` collision on all bounds. Orange spawn marker at origin. Player instanced at spawn.
- **I0-5** Run instructions — README states Godot 4.3, how to open `project.godot`, F5, click-to-capture, WASD, mouse look, Esc, quit, known issues. This changelog.

### Known issues

- Clone: `git clone -b iter/I-0 https://github.com/zachmofo/fps-studio.git`
- Cursor starts visible; left-click is required to capture.
- No exported build; testers run from the Godot 4.3 editor (F5).
- No jump, sprint, shoot, HUD, audio, AI, or second room (I-0 not-this-time).
