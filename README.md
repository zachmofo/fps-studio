# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-15**. Engine: **Godot 4.3**. Chunky heavy rifle in FOV.

## Clone / open

```
git clone -b iter/I-15 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Capture, then fight. Viewmodel: dark heavy rifle lower-right; barrel tip below HUD + and ~8–12% left of screen center.
2. Fire: camera kick 1.8° + rifle mesh ~5° down-back / 1.5 cm toward camera, settle 0.18 s. Orange-yellow muzzle at tip.
3. Mag 10. Reload ~1.2 s. Fire cancels sprint.
4. Room dress (I-14) + dummy return-fire (I-13) unchanged.
5. **WASD** walk 5.0. **Shift** sprint 8.0. **Space** jump. **Esc** frees the cursor.

Sounds live under `res://audio/`.

## I-15 changelog

Chunky Iron Saint viewmodel + kick/muzzle Pike lock. Tip fix: idle tip ~8–12% left of HUD center.

## Known issues

- No music, VO, ADS, stamina, slide, or second dummy.
- No hands on the viewmodel.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
