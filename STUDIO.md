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

## Iteration 5 — I-5

**Goal:** The dark rifle kicks. Recoil, muzzle flash, ammo. Same room. Same dummy. Same cover.

**Not this time:** sprint, win banner, dummy uses cover, 3D map rebuild, audio, ADS, second dummy, merge.

### Tickets

- I5-1 Recoil (camera + viewmodel)
- I5-2 Muzzle flash
- I5-3 Mag 10, R reload 1.2 s, dry fire no ray
- I5-4 HUD `AMMO n/10`
- I5-5 Capture, jump, dummy 3-hit, cover, rifle, Esc, death/respawn unchanged
- I5-6 README, STUDIO.md, CHANGELOG

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-08-29 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-5 on `iter/I-5` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
