# Changelog

## I-0 — 2026-08-28

**Engine:** Godot 4.3 (GDScript, GL Compatibility)
**Repo URL:** https://github.com/zachmofo/fps-studio
**Branch:** `iter/I-0`
**Build ID:** I-0

### Tickets

- **I0-1** Project skeleton — Godot 4.3 `project.godot` at repo root, `.gitignore`, `STUDIO.md` at root, branch `iter/I-0`. Remote https://github.com/zachmofo/fps-studio.
- **I0-2** Player controller — `CharacterBody3D`, WASD via named InputMap, 5 m/s, gravity, no jump, no xz drift.
- **I0-3** Camera — yaw on body, pitch on Camera3D, clamp ~±89°, raw mouse. Click captures; Esc releases. Sensitivity `0.0025` rad/pixel.
- **I0-4** Empty arena — ~20×20 m enclosed room, collision on bounds, orange spawn marker.
- **I0-5** README run path.

### Known issues

- Cursor starts visible; left-click to capture. Esc releases, does not quit.
- No exported binary; run from Godot 4.3 editor (F5).
- No jump, sprint, shoot, HUD, enemy (I-0 not-this-time).
