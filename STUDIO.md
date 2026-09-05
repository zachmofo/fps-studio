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

## Iteration 16 — I-16

**Goal:** every crack shows a bright spit where the shot landed.

**Not this time:** pig, second dummy, merge, full particle rewrite.

### Tickets

- I16-1 World impact sparks (walls/floor/misses)
- I16-2 Crate hit: sparks + dark fleck
- I16-3 Dummy hit: white flash + orange sparks
- I16-4 Compatibility MeshInstance / timed meshes
- I16-5 No muzzle / tip / kick / room / RF regress
- I16-6 README, STUDIO.md, CHANGELOG

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-09-05 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-16 on `iter/I-16` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |
