# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-16**. Engine: **Godot 4.3**. Bright spit on every crack.

## Clone / open

```
git clone -b iter/I-16 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Capture, then fight. Viewmodel: dark heavy rifle lower-right; tip below HUD + and ~8–12% left of center (I-15).
2. Shoot walls/floor: 4–8 yellow-orange sparks at the hit, ~0.15m spread, fade out ~0.12–0.18 s. No lasting decals.
3. Shoot cover crates (`Cover*`): same sparks + one darker fleck.
4. Shoot the dummy: white flash ≥0.2 s + 3–5 orange sparks at the hit (bigger pop on kill). Eyes stay red.
5. Mag 10. Reload ~1.2 s. Room dress + return-fire unchanged.
6. **WASD** walk 5.0. **Shift** sprint 8.0. **Space** jump. **Esc** frees the cursor.

Sounds live under `res://audio/`.

## I-16 changelog

Impact sparks on world / crate / dummy hits. Compatibility timed meshes. Muzzle/kick/room/RF unchanged.

## Known issues

- No music, VO, ADS, stamina, slide, or second dummy.
- No hands on the viewmodel.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
