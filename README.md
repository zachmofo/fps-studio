# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-13**. Engine: **Godot 4.3**. Dummy return-fire is obvious: gun mesh, yellow muzzle, faster peek cadence.

## Clone / open

```
git clone -b iter/I-13 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Capture, then fight. Dummy peeks CoverMid with a dark rifle on the right shoulder.
2. Every return-fire shot: thinner crack + orange-yellow muzzle ~0.09 s. Cadence 0.75 s while out. LOS required.
3. Player hit: ColorRect peak then fade (Pike lock). HP 3.
4. Humanoid + red eyes (I-12). Room materials (I-11). CoverMid out 2.0 s / in 1.5 s.
5. **WASD** walk 5.0. **Shift** sprint 8.0. **Space** jump. Mag 10. **Esc** frees the cursor.

Sounds live under `res://audio/`.

## I-13 changelog

Return-fire proof. Gun + muzzle + 0.75 s out cadence + harder hit flash.

## Known issues

- No music, VO, ADS, stamina, slide, or second dummy.
- Dummy does not use the left mid crate or the spawn peek box.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
