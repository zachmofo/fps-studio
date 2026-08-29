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

## Iteration 7 — I-7

**Goal:** Hold Shift to sprint. Same room. Same rifle. No new geo.

**Not this time:** aerial 3D, dummy uses cover, audio, ADS, coyote, second dummy, merge.

### Tickets

- I7-1 Shift sprint 8.0 / walk 5.0
- I7-2 No air sprint. Shot cancels sprint. No FOV punch, slide, stamina
- I7-3 Gun, capture, CLEARED 3s, death skip unchanged
- I7-4 HUD unchanged, no sprint meter
- I7-5 README, STUDIO.md, CHANGELOG

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-08-29 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-7 on `iter/I-7` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
