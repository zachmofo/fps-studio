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

## Iteration 10 — I-10

**Goal:** The floor reads as a killing floor. Same 20x20. No new collision. No extra boxes.

**Not this time:** aerial 3D rebuild, second dummy, coyote, ADS, merge.

### Tickets

- I10-1 Unlit 4 X + 4 Z strips, Color(0.62, 0.82, 0.70), skip orange pad
- I10-2 Spawn, walls, cover, dummy CoverMid unchanged
- I10-3 Sprint, gun, audio, HUD unchanged
- I10-4 README, STUDIO.md, CHANGELOG

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-09-01 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-10 on `iter/I-10` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
