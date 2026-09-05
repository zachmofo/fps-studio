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

## Iteration 13 — I-13

**Goal:** The dummy CLEARLY shoots back. Hide and you see/feel the peek shot.

**Not this time:** grate/pillar/pipes (later), pig, second dummy, merge.

### Tickets

- I13-1 Dummy gun mesh while peeking
- I13-2 Muzzle flash with return-fire crack
- I13-3 0.75 s out cadence, LOS only
- I13-4 Harder player hit flash
- I13-5 Silhouette / CoverMid / materials unchanged
- I13-6 README, STUDIO.md, CHANGELOG

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-09-05 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-13 on `iter/I-13` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
