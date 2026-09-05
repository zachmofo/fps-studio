# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-12**. Engine: **Godot 4.3**. Humanoid target with red eyes. Same CoverMid duel as I-11.

## Clone / open

```
git clone -b iter/I-12 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Dummy: hunched rust-red humanoid (~1.85 m), dark shoulders, glowing red eyes. Not a capsule pill. Collision capsule / peek math unchanged.
2. Room: I-11 concrete + flush strips. Orange spawn pad. Metal crates.
3. Mouse starts **visible**. Capture click is silent. Dummy takes CoverMid (right). Peek 0.7 m. Out 2.0 s / in 1.5 s.
4. Hit: white flash ≥0.22 s on body (eyes stay red). 3 HP. Audio same as I-9.
5. **WASD** walk 5.0. **Shift** sprint 8.0. **Space** jump.
6. `HP N` / `AMMO n/10` / **CLEAR THE ROOM**. Kill dummy. **CLEARED** 3 s then reset.
7. Mag 10. **Esc** frees the cursor.

Sounds live under `res://audio/`.

## I-12 changelog

Humanoid silhouette + eyes. Same fight, same room materials.

## Known issues

- No music, VO, ADS, stamina, slide, or second dummy.
- Dummy does not use the left mid crate or the spawn peek box.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
