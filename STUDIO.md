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

## Iteration 15 — I-15

**Goal:** YOUR heavy rifle reads in FOV. Chunky Iron Saint gun, not an SMG stick.

**Not this time:** second gun, ADS zoom, brass particles required, pig, merge.

### Tickets

- I15-1 Viewmodel silhouette (Pike lock)
- I15-2 Kick camera + mesh
- I15-3 Muzzle at barrel tip
- I15-4 No room / return-fire regress
- I15-5 README, STUDIO.md, CHANGELOG

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-09-05 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-15 on `iter/I-15` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
