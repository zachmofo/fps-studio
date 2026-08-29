# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-4**. Engine: **Godot 4.3**. Walk, jump, look, shoot a walking dummy from cover. Dark rifle in FOV.

## Clone / open

```
git clone -b iter/I-4 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Mouse starts **visible**. Dummy strafes (rust-red body, dark head). Dummy does **not** shoot yet.
2. **Left-click once** to capture (no shot). Fight starts. Dummy's first shot is ~**1 s after capture**.
3. **WASD** walk. **Space** jump. **Mouse** look. Dark rifle lower-right. White `+` reticle. `HP N`.
4. Spawn view: a waist-high box ~4 m to the right is the first peek. Two more boxes sit mid-room toward the dummy.
5. **Captured left-click** hitscan. Dummy body/head go **white ≥0.2 s**. **3 hits** kill it.
6. Dummy return-fires ~1 s while captured. **Red full-screen flash** and **HP N** update.
7. **HP 0**: die, no walk ~1 s, respawn on the orange pad, dummy back on its line, mouse stays captured.
8. **Esc** frees the cursor and pauses dummy fire. Recapture is grab-only.

## I-4 changelog

Dark unlit rifle in FOV. Three waist-high cover boxes. Dummy dark head at 1.6 m. Capture, HP, reticle unchanged.

## Known issues

- No viewmodel kick, recoil, reload, sprint, ammo, audio, or second dummy.
- Dummy patrols a line. It does not chase or use cover.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
