# Changelog

## I-8 — 2026-09-01

Branch `iter/I-8` from `52cfae1`. Pike cover lock.

- I8-1 After capture, dummy leaves x-patrol and takes CoverMid (right mid crate, same side as spawn peek). Not left mid. Not spawn peek. Walk 2.4.
- I8-2 Peek 0.7 m past that box edge. Out 2.0 s (two shots, cadence 1.0 s; walk-out counts once the head is visible) then in 1.5 s. Loop. Hitscan still needs LOS. Dummy still peeks if the player is on the same box.
- I8-3 Capture-then-fight, 3 HP, 0.22 s white flash, rust-red + dark head. CLEARED 3 s and death reset: dummy back to _home, then retakes cover if still captured.
- I8-4 Player sprint/gun/HUD/room unchanged. No new geo.
- I8-5 README clone path is `iter/I-8`. STUDIO.md current state is I-8.

## I-7 — 2026-08-29

Shift sprint 8.0. No air sprint. Shot cancels sprint.
