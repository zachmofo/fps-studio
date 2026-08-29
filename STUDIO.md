# FPS Studio

Name: **Iron Saint** (locked 2026-08-28).
Source of truth: this file + https://github.com/zachmofo/fps-studio

## Roster

| Who | Lane | Does not |
| --- | --- | --- |
| Zach | Owner. Merge to main, publish, spend, v0. | Day-to-day tickets. |
| Reed | PM. Scope, tickets, review, iteration loop. | Production game code. |
| Vega | Sole implementer. Repo, branches, builds, README. | Invent genre features. Merge. |
| Pike | Playtest: feel, combat, UX. Reports to Reed. | Game code. Tickets to Vega. |
| Wren | QA: stability, regressions. Reports to Reed. | Game code. Gun-feel. |

## Fantasy

**Iron Saint** — Fluorescent killing floor, one heavy rifle that kicks like it hates you. You stay for the next clean peek.

## Engine

Godot **4.3**, GDScript, GL Compatibility. Do not rewrite mid-slice.

## Iteration 0 — I-0

**Goal:** Bootable Godot 4.3 project. Walk and look in an empty enclosed room. Tester runs from README.

**Not this time:** shoot, sprint, jump, HUD, enemy, ammo, multiplayer.

### Tickets

- **I0-1** Skeleton — Godot 4.3 at repo root, `.gitignore`, `STUDIO.md` at root, `config/name` = Iron Saint, branch `iter/I-0`.
- **I0-2** WASD walk, gravity, no jump. Named input actions.
- **I0-3** Mouse look, pitch clamp ~±89°, click capture, Esc release. Raw mouse.
- **I0-4** Enclosed ~20x20 arena, collision, visible spawn.
- **I0-5** README with exact 4.3, open/F5/quit, known issues, changelog.

## Test charter (from I-1)

I-0 is not a playtest. Pike/Wren wait until Reed names a commit. Same SHA for both. Cannot-run is S1. Pike owns feel. Wren owns broken. Do not ticket Vega.

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-08-28 |
| Name | Iron Saint |
| Engine | Godot 4.3 |
| Iteration | I-0 on `iter/I-0` |
| Repo | https://github.com/zachmofo/fps-studio |
| Merge | do not merge to main |

Next: Vega posts I-0 SHA in #fps-studio. Pike/Wren idle until Reed names that commit.
