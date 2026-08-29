# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-6**. Engine: **Godot 4.3**. Walk, jump, peek cover, shoot a walking dummy. Clear the room.

## Clone / open

```
git clone -b iter/I-6 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Mouse starts **visible**. Dummy strafes. Dummy does **not** shoot yet.
2. **Left-click once** to capture (no shot). Fight starts.
3. **WASD** walk. **Space** jump. **Mouse** look. Dark rifle. White `+`. `HP N`. `AMMO n/10`. Under that: **CLEAR THE ROOM** (dim).
4. Kill the dummy (3 hits). It stays down. Objective becomes **CLEARED** (bright). After **3 s** the dummy resets and the line goes back to CLEAR THE ROOM.
5. If you die first: ~1 s freeze, respawn on the orange pad, full mag, dummy back, line stays CLEAR THE ROOM. No 3 s wait.
6. Recoil 1.8° / ±0.35° / 0.18 s. Flash 0.09 s. Mag 10. R or empty auto-reloads 1.2 s.
7. **Esc** frees the cursor. Recapture is grab-only.

## I-6 changelog

Objective under AMMO. Dummy death: CLEARED 3s then dummy resets. No center banner. I-5 gun unchanged.

## Known issues

- No audio. No ADS, sprint, or second dummy.
- Dummy patrols a line. It does not use cover.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
