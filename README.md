# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-1**. Engine: **Godot 4.3**. Walk, look, shoot a rust-red dummy, take damage, die, respawn.

## Requirements

- **Godot 4.3** (exact): https://godotengine.org/download/archive/4.3-stable/

## Clone / open

```
git clone -b iter/I-1 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

1. Godot 4.3 → open `project.godot` → **F5**.
2. Mouse starts **visible**. **Left-click once** to capture (this click does **not** fire).
3. **WASD** walk. **Mouse** look. White crosshair is center of view.
4. **Left-click while captured** fires a hitscan (~50 m, one shot per press).
5. Rust-red dummy ~7 m ahead. **3 hits** kill it (white flash). Dummy return-fires ~1 s while both live.
6. Top-left **HP 3**. At **HP 0** you die, cannot walk for ~1 s, then respawn on the orange pad with HP 3 and a live dummy. Mouse stays captured after death.
7. **Esc** frees the cursor. Recapture with left-click (no shot). **F8** / close window quits.

## I-1 changelog (fix pass)

I1-7 dummy.gd types so the script loads (3-hit kill, flash, return fire, reset). I1-8 first spawn mouse visible; death recaptures. I1-9 rust-red mesh in dummy.tscn. I1-10 `HP 3` label. I1-11 center reticle. I1-12 no WASD while dead. I1-13 README matches play.

## Known issues

- No viewmodel, recoil, reload, sprint, jump, ammo, audio, or second dummy.
- Dummy does not walk or lead shots.
- Capsule vs box corners can feel sticky.
- Editor F5 only.
