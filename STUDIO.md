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

## Iteration 6 — I-6

**Goal:** Dummy dies, you clear the room. Same 20x20. Same rifle. No new geo.

**Not this time:** sprint, 3D map, extra cover, dummy uses cover, second dummy, audio, ADS, merge.

### Tickets

- I6-1 Dummy stays down until reset
- I6-2 No center banner
- I6-3 Objective under AMMO: CLEAR THE ROOM / CLEARED 3s then dummy resets
- I6-4 Player death resets dummy, no 3s wait
- I6-5 Capture, jump, gun, cover unchanged
- I6-6 README, STUDIO.md, CHANGELOG

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-08-29 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-6 on `iter/I-6` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
