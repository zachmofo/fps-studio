# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-5**. Engine: **Godot 4.3**. Walk, jump, peek cover, shoot a walking dummy with a heavy rifle.

## Clone / open

```
git clone -b iter/I-5 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Mouse starts **visible**. Dummy strafes. Dummy does **not** shoot yet.
2. **Left-click once** to capture (no shot). Fight starts. Dummy's first shot is ~**1 s after capture**.
3. **WASD** walk. **Space** jump. **Mouse** look. Dark rifle lower-right. White `+` reticle. `HP N`. `AMMO n/10` under HP.
4. **Captured left-click** fires one round. Kick is **1.8°** up and **±0.35°** yaw, settles in **~0.18 s**. Muzzle flash **0.09 s**. **10** rounds.
5. Last round auto-reloads **1.2 s**. **R** also reloads to 10. Walk and look stay live. Cannot fire until reload finishes. Empty HUD is `AMMO 0/10`.
6. Dummy body/head go **white ≥0.2 s** on hit. **3 hits** kill it. Cover boxes in the room.
7. Dummy return-fires ~1 s while captured. **Red full-screen flash** and **HP N** update.
8. **HP 0**: die, no walk ~1 s, respawn on the orange pad with a full mag, dummy back on its line, mouse stays captured.
9. **Esc** frees the cursor and pauses dummy fire. Recapture is grab-only.

## I-5 changelog

Pike recoil (1.8° / ±0.35° / 0.18s). Muzzle flash 0.09s. Mag 10. Empty auto-reloads 1.2s. `AMMO n/10`. I-4 room unchanged.

## Known issues

- No audio. No ADS, sprint, or second dummy.
- Dummy patrols a line. It does not use cover.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
