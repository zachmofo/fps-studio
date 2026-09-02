# Iron Saint

FPS Studio **Iron Saint**, Iteration **I-8**. Engine: **Godot 4.3**. Walk, sprint, jump, peek cover, shoot a dummy that uses the right mid crate. Clear the room.

## Clone / open

```
git clone -b iter/I-8 https://github.com/zachmofo/fps-studio.git
cd fps-studio
```

Godot **4.3** → open `project.godot` → **F5**.

1. Mouse starts **visible**. Dummy strafes on its line. Dummy does **not** shoot yet.
2. **Left-click once** to capture (no shot). Dummy leaves the line and takes **CoverMid** (right mid crate, same side as the spawn peek). Left mid stays yours. Spawn peek box is not dummy cover.
3. Dummy peeks **0.7 m** past that box edge so rust-red + head read. **Out 2.0 s** (two shots, cadence 1.0 s; the walk-out counts once the head is visible) then **in 1.5 s**. Loop. Hitscan still needs LOS.
4. **WASD** walk (5.0). Hold **Shift** to sprint (8.0). **Space** jump. Jump or a shot drops you to 5.0.
5. Dark rifle. White `+`. `HP N`. `AMMO n/10`. **CLEAR THE ROOM** under AMMO.
6. Kill the dummy (3 hits, 0.22 s white flash). **CLEARED** 3 s, then dummy resets to home and retakes cover if you still have the mouse.
7. Die first: ~1 s freeze, respawn, dummy back to home then cover if captured. Line stays CLEAR THE ROOM.
8. Recoil 1.8° / ±0.35° / 0.18 s. Flash 0.09 s. Mag 10. **R** or empty auto-reloads 1.2 s.
9. **Esc** frees the cursor. Recapture is grab-only.

## I-8 changelog

Dummy uses CoverMid (right). Peek 0.7 m. Out 2.0 s / in 1.5 s. Player sprint/gun/HUD/room unchanged.

## Known issues

- No audio. No ADS, stamina, slide, or second dummy.
- Dummy does not use the left mid crate or the spawn peek box.
- Jump has no coyote time.
- Capsule vs box corners can still catch at speed.
- Editor F5 only.
