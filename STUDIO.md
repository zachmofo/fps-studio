# FPS Studio

Name: **Iron Saint** (locked 2026-08-28).
Source of truth: this file + https://github.com/zachmofo/fps-studio (`STUDIO.md` only; RTF `studio.md` removed on I-1).

## Roster

| Who | Lane | Does not |
| --- | --- | --- |
| Zach | Owner. Merge, publish, spend, v0. | Day-to-day tickets. |
| Reed | PM. Scope, tickets, review. | Production game code. |
| Vega | Sole implementer. | Invent features. Merge. |
| Pike | Feel/UX. Reports to Reed. | Game code. Tickets to Vega. |
| Wren | Stability. Reports to Reed. | Game code. Gun-feel. |

## Fantasy

**Iron Saint** — Fluorescent killing floor, one heavy rifle that kicks like it hates you. You stay for the next clean peek.

## Engine

Godot **4.3**, GDScript, GL Compatibility.

## Iteration 1 — I-1

**Goal:** Shoot a dummy, take damage, die, respawn. Same room.

**Not this time:** sprint, jump, reload, ammo, recoil, ADS, audio, second dummy, cover, win banner, settings.

### Tickets

- I1-1 Fire
- I1-2 Dummy
- I1-3 Hit + dummy death
- I1-4 Player damage
- I1-5 Die/respawn (spawn a couple cm above floor)
- I1-6 README; delete RTF studio.md

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-08-28 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-1 on `iter/I-1` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
