# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-10**. Engine: **Godot 4.3**. Killing-floor strips. Walk, sprint, jump, peek cover, shoot the dummy on CoverMid.

## Clone / open

```
git clone -b iter/I-10 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Floor: unlit fluorescent grid, 4 strips X and 4 strips Z at ±2/±6, `Color(0.62, 0.82, 0.70)`, flush in the floor (not proud). They skip the orange spawn pad. No extra collision.
2. Mouse starts **visible**. Dummy strafes. Capture click is silent (no crack).
3. Dummy takes CoverMid (right). Peek 0.7 m. Out 2.0 s / in 1.5 s.
4. Captured fire: heavy crack. Dummy: thinner crack. Dry/empty: click. Hit thunk. Death thud. Reload mag-in then close.
5. **WASD** walk 5.0. **Shift** sprint 8.0. **Space** jump.
6. `HP N` / `AMMO n/10` / **CLEAR THE ROOM**. Kill dummy (3 hits). **CLEARED** 3 s then reset.
7. Recoil 1.8° / ±0.35° / 0.18 s. Mag 10. **Esc** frees the cursor.

Sounds live under `res://audio/`.

## I-10 changelog

Unlit floor strips, Pike color. Same room, same cover, same gun/audio/HUD.

## Known issues

- No music, VO, ADS, stamina, slide, or second dummy.
- Dummy does not use the left mid crate or the spawn peek box.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
