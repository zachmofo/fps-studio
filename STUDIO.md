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

## Iteration 9 — I-9

**Goal:** You can tell who shot. Same room. Same cover. No new geo.

**Not this time:** music, VO, SAW belt, pig, extra geo, merge.

### Tickets

- I9-1 Player crack (not on capture). Dry-fire click.
- I9-2 Dummy hit thunk with 0.22 s flash
- I9-3 Dummy death thud, no scream
- I9-4 Reload mag-in + close inside 1.2 s
- I9-5 Dummy thinner crack
- I9-6 Sounds in res://audio. README / STUDIO / CHANGELOG

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-09-01 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-9 on `iter/I-9` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
