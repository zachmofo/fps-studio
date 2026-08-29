# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-3**. Engine: **Godot 4.3**. Walk, jump, look, shoot a walking rust-red dummy, take damage, die, respawn.

## Clone / open

```
git clone -b iter/I-3 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Mouse starts **visible**. Dummy strafes. Dummy does **not** shoot yet.
2. **Left-click once** to capture (no shot). Fight starts. Dummy's first shot is ~**1 s after capture**.
3. **WASD** walk. **Space** jump. **Mouse** look. White crosshair.
4. **Captured left-click** hitscan. Dummy goes **white ≥0.2 s** on hit, then rust-red. **3 hits** kill it.
5. Dummy return-fires ~1 s while captured. **Red full-screen flash** and **HP N** update.
6. **HP 0**: die, no walk ~1 s, respawn on the orange pad, dummy back on its line, mouse stays captured.
7. **Esc** frees the cursor and pauses dummy fire. Recapture is grab-only.

## I-3 changelog

Space jump. Dummy CharacterBody3D strafes on X. Player capsule 0.35 + safe_margin 0.08. I-2 combat still holds.

## Known issues

- No viewmodel, recoil, reload, sprint, ammo, audio, or second dummy.
- Dummy patrols a line. It does not chase or lead shots.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
