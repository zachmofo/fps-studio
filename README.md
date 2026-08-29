# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-7**. Engine: **Godot 4.3**. Walk, sprint, jump, peek cover, shoot a walking dummy. Clear the room.

## Clone / open

```
git clone -b iter/I-7 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Mouse starts **visible**. Dummy strafes. Dummy does **not** shoot yet.
2. **Left-click once** to capture (no shot). Fight starts.
3. **WASD** walk (5.0). Hold **Shift** to sprint (8.0). Release Shift = walk. **Space** jump. Jump or a shot drops you to 5.0. Shift only resumes 8.0 on the ground after landing, and after you release fire if Shift is still held.
4. Dark rifle. White `+`. `HP N`. `AMMO n/10`. **CLEAR THE ROOM** (dim) under AMMO. No sprint meter.
5. Kill the dummy (3 hits). Objective becomes **CLEARED** (bright) for **3 s**, then the dummy resets.
6. Die first: ~1 s freeze, respawn, dummy back, line stays CLEAR THE ROOM.
7. Recoil 1.8° / ±0.35° / 0.18 s. Flash 0.09 s. Mag 10. **R** or empty auto-reloads 1.2 s.
8. **Esc** frees the cursor. Recapture is grab-only.

## I-7 changelog

Shift sprint 8.0. No air sprint. Shot cancels sprint. HUD unchanged. I-6 room/gun unchanged.

## Known issues

- No audio. No ADS, stamina, slide, or second dummy.
- Dummy patrols a line. It does not use cover.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
