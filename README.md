# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-11**. Engine: **Godot 4.3**. Concrete room, metal crates, killing-floor strips. Same fight as I-10.

## Clone / open

```
git clone -b iter/I-11 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Room: dark concrete floor `Color(0.14, 0.14, 0.16)`, cooler dirty walls, darker ceiling. Mid-height scuff stripe. Flush strips `Color(0.62, 0.82, 0.70)`. Orange spawn pad. Metal crates with a rim. Unlit only — no lamps.
2. Mouse starts **visible**. Dummy strafes. Capture click is silent (no crack).
3. Dummy takes CoverMid (right). Peek 0.7 m. Out 2.0 s / in 1.5 s.
4. Captured fire: heavy crack. Dummy: thinner crack. Dry/empty: click. Hit thunk. Death thud. Reload mag-in then close.
5. **WASD** walk 5.0. **Shift** sprint 8.0. **Space** jump.
6. `HP N` / `AMMO n/10` / **CLEAR THE ROOM**. Kill dummy (3 hits). **CLEARED** 3 s then reset.
7. Recoil 1.8° / ±0.35° / 0.18 s. Mag 10. **Esc** frees the cursor.

Sounds live under `res://audio/`.

## I-11 changelog

Materials pass. Same 20×20, same duel, same gun/audio/HUD.

## Known issues

- No music, VO, ADS, stamina, slide, or second dummy.
- Dummy does not use the left mid crate or the spawn peek box.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
