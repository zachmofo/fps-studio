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

## Iteration 11 — I-11

**Goal:** The room stops looking like a graybox. Same 20x20. Same fight. No new gameplay.

**Not this time:** second dummy, aerial 3D rebuild, pig boss, ADS, coyote, merge, PBR metalness maps.

### Tickets

- I11-1 Floor concrete Color(0.14, 0.14, 0.16); strips stay locked
- I11-2 Walls / ceiling industrial; mid scuff; unshaded
- I11-3 Metal crates with rim; same collision
- I11-4 Unlit only; strips are the light
- I11-5 Fight / gun / audio / HUD unchanged
- I11-6 README, STUDIO.md, CHANGELOG

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-09-05 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-11 on `iter/I-11` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
