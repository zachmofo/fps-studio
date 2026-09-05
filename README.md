# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-14**. Engine: **Godot 4.3**. Industrial room dress on the same 20×20 fight.

## Clone / open

```
git clone -b iter/I-14 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Capture, then fight. Dummy peeks CoverMid with dark rifle + orange-yellow muzzle (I-13).
2. Center floor grate (visual only). Far-left pillar blocks player + hitscan. Right-wall high pipes (no collision).
3. Room materials still unlit-only. Floor / walls / crates / strips unchanged.
4. **WASD** walk 5.0. **Shift** sprint 8.0. **Space** jump. Mag 10. **Esc** frees the cursor.

Sounds live under `res://audio/`.

## I-14 changelog

Industrial bones: grate + pillar + pipes. Return-fire unchanged.

## Known issues

- No music, VO, ADS, stamina, slide, or second dummy.
- Dummy does not use the left mid crate or the spawn peek box.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
