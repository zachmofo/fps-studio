# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-9**. Engine: **Godot 4.3**. Walk, sprint, jump, peek cover, shoot a dummy on CoverMid. You can tell who shot.

## Clone / open

```
git clone -b iter/I-9 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Mouse starts **visible**. Dummy strafes. Dummy does **not** shoot. Capture click is silent.
2. **Left-click once** to capture (no shot, no crack). Fight starts. Dummy takes CoverMid (right).
3. Captured fire: one heavy indoor crack per round. Empty / dry fire: a short click, then reload. Dummy return-fire is a thinner, higher crack.
4. Dummy hit: dull thunk on the 0.22 s white flash. Dummy death: short thud. No scream.
5. **R** or empty auto-reload 1.2 s: mag-in, then close.
6. **WASD** walk (5.0). Hold **Shift** sprint (8.0). **Space** jump.
7. `HP N` / `AMMO n/10` / **CLEAR THE ROOM**. Kill dummy (3 hits). **CLEARED** 3 s, then dummy resets to home and retakes cover if captured.
8. Recoil 1.8° / ±0.35° / 0.18 s. Flash 0.09 s. Mag 10. **Esc** frees the cursor.

Sounds live under `res://audio/`.

## I-9 changelog

Player crack vs dummy crack. Dry click. Hit thunk. Death thud. Reload two beats. Cover/sprint/gun/HUD unchanged.

## Known issues

- No music, VO, ADS, stamina, slide, or second dummy.
- Dummy does not use the left mid crate or the spawn peek box.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
