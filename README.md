# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-1**. Engine: **Godot 4.3** (GDScript, GL Compatibility). Walk, look, shoot a dummy, take damage, die, respawn. Same room as I-0.

## Requirements

- **Godot 4.3** (exact): https://godotengine.org/download/archive/4.3-stable/
- Do not open in Godot 3.x or 4.2.

## Clone / open

Repo: https://github.com/zachmofo/fps-studio  
Branch: `iter/I-1` (do not use `main` or `iter/I-0` for this slice).

```
git clone -b iter/I-1 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

1. Godot 4.3 → Import / open `project.godot`.
2. **F5** (Play). Main scene: `scenes/main.tscn`.
3. **Left-click** once to capture the mouse (this click does not shoot).
4. **WASD** walk. **Mouse** look. **Left-click** while captured to fire a hitscan (~50 m, one shot per press).
5. A rust-red dummy stands ~7 m in front of the orange spawn pad. **3 hits** kill it (white flash on hit).
6. Dummy return-fires about once a second while both are alive. Top-left number is your HP (3). **0 HP** = death, then ~1 s later you respawn on the orange pad with 3 HP and the dummy is alive again. Mouse stays captured.
7. **Esc** releases the cursor. Close the play window or **F8** to quit.

Sensitivity: `0.0025` rad/pixel on Player. Raw mouse, no accel.

## I-1 changelog

Fire (captured LMB, no ammo/recoil), one dummy, 3-hit kill with flash, dummy return fire, 3 HP, die/respawn on the orange marker (spawn lifted a couple cm), health integer, RTF `studio.md` removed so `STUDIO.md` is the only studio file.

## Known issues

- Capturing click does not fire (by design).
- No reload, ammo, sprint, jump, recoil, ADS, audio, second dummy, cover, or settings.
- Dummy does not walk or lead shots.
- Capsule vs box corners can feel sticky.
- No exported binary; run from the Godot 4.3 editor.
