# FPS Studio

Name: **Iron Saint** (locked 2026-08-28).
Source of truth: this file + https://github.com/zachmofo/fps-studio (`STUDIO.md` only; RTF `studio.md` removed on I-1).

## Roster

| Who | Lane | Does not |
| --- | --- | --- |
| Zach | Owner. Merge, publish, spend, v0. | Day-to-day tickets. |
| Reed | PM. Scope, tickets, review. | Production game code. |
| Vega | Sole implementer. | Invent features. Merge. |
| Pike | Design (feel, body, cover, gun, HUD). Notes to Reed. | Game code. Tickets to Vega. Test. |
| Wren | Only tester. Stability, regressions. Reports to Reed. | Game code. Gun-feel. |

## Fantasy

**Iron Saint** — Fluorescent killing floor, one heavy rifle that kicks like it hates you. You stay for the next clean peek.

## Engine

Godot **4.3**, GDScript, GL Compatibility.

## Iteration 8 — I-8

**Goal:** Dummy uses cover. Same 20x20. Same 3 boxes. No new geo.

**Not this time:** new boxes, aerial 3D, second dummy, audio, pig boss, ADS, merge.

### Tickets

- I8-1 Dummy takes CoverMid (right). Left mid player-only. Spawn peek is not dummy cover.
- I8-2 Peek 0.7 m. Out 2.0 s (two shots) / in 1.5 s. Walk 2.4. Cadence 1.0 s.
- I8-3 Capture-then-fight, CLEARED 3 s, death reset to _home then cover
- I8-4 Player sprint/gun/HUD/room unchanged
- I8-5 README, STUDIO.md, CHANGELOG

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-09-01 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-8 on `iter/I-8` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
