# Changelog

## I-11 — 2026-09-05

Branch `iter/I-11` from `9c108b4`. Pike material lock.

- I11-1 Floor concrete Color(0.14, 0.14, 0.16) unshaded. Strips Color(0.62, 0.82, 0.70) flush. Orange pad stays.
- I11-2 Walls Color(0.42, 0.40, 0.38), ceiling Color(0.28, 0.28, 0.30), mid-height scuff stripe. Unshaded. No normal maps.
- I11-3 Cover crates metal Color(0.22, 0.24, 0.22) with edge Color(0.30, 0.32, 0.30). Same sizes, positions, collision.
- I11-4 Unlit materials only. No Omni/Directional. Strips carry the light. Ambient nudged so the room is not crushed black.
- I11-5 Rifle, HUD, sprint, CoverMid AI, CLEARED, audio: unchanged.
- I11-6 README clone path is `iter/I-11`. STUDIO.md current state is I-11.

## I-10 — 2026-09-01

Branch `iter/I-10` from `6fa3a6e`. Pike strip lock.

- I10-1 Unlit fluorescent strips on the floor. 4 X + 4 Z, equally spaced 4m. Flush in the floor seams (not proud). Skip the orange pad. Albedo Color(0.62, 0.82, 0.70), unshaded, dim, no emission. No collision. No light nodes.
- I10-2 Orange spawn pad, gray walls/ceiling, three cover boxes, dummy CoverMid: unchanged.
- I10-3 Sprint, gun, audio, HUD, CLEARED: unchanged.
- I10-4 README clone path is `iter/I-10`. STUDIO.md current state is I-10.

## I-9 — 2026-09-01

Branch `iter/I-9` from `c228b0b`. Pike audio lock.

- I9-1 Player captured fire: one heavy crack per round. Not on the capture click. Dry fire / empty: short click, no crack.
- I9-2 Dummy `receive_hit`: dull thunk on the same frame as the 0.22 s white flash.
- I9-3 Dummy death: short thud. No scream.
- I9-4 Reload: two beats inside 1.2 s (mag in, close).
- I9-5 Dummy return-fire: thinner, higher, less bass than the player. Still one crack.
- I9-6 Sounds live in `res://audio/`. README clone path is `iter/I-9`. STUDIO.md current state is I-9.

## I-8 — 2026-09-01

Dummy takes CoverMid (right). Peek 0.7 m. Out 2.0 s / in 1.5 s.
