# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-2**. Engine: **Godot 4.3**. Walk, look, shoot a rust-red dummy, take damage, die, respawn.

## Clone / open

```
git clone -b iter/I-2 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Mouse starts **visible**. Dummy does **not** shoot yet.
2. **Left-click once** to capture (this click does **not** fire). Fight starts. Dummy's first shot is about **1 s after capture**, not on the click.
3. **WASD** walk. **Mouse** look. White crosshair at center.
4. **Captured left-click** hitscan (~50 m, one shot per press). Dummy goes **bright white ≥0.2 s** on hit, then rust-red. **3 hits** kill it.
5. Dummy return-fires ~1 s while the mouse is captured and both are alive. You get a **red full-screen flash** and **HP N** updates.
6. **HP 0**: you die, cannot walk ~1 s, then respawn on the orange pad, dummy alive, mouse stays captured.
7. **Esc** frees the cursor and pauses dummy fire. Recapture with left-click (no shot). Dummy waits ~1 s again.

## I-2 changelog

I2-1 dummy silent until capture; `_acc` resets on capture. I2-2 hit flash white 0.22 s on the mesh material. I2-3 player red Hud flash 0.15 s. I2-4 this README.

## Known issues

- No viewmodel, recoil, reload, sprint, jump, ammo, audio, cover, or second dummy.
- Dummy does not walk or lead shots.
- Capsule vs box corners can feel sticky.
- Editor F5 only.
