# FPS Studio

Name: **Iron Saint** (locked 2026-08-28). Date opened: 2026-08-28.
Source of truth: this file + https://github.com/zachmofo/fps-studio

## Roster

| Who | Lane | Does not |
| --- | --- | --- |
| Zach | Owner. Scope changes, merge to main, publish, spend. | Day-to-day tickets. |
| Reed | PM. Scope, priorities, design, code review, iteration loop, reporting. | Production game code. Quick-fix Vega's branch. Substitute testing. |
| Vega | Sole implementer. Engine, repo, branches, builds, changelog, README run path. | Invent genre features. Merge/publish. Argue design with testers. |
| Pike | Playtest: combat, movement, feel, UX. Reports to Reed. | Game code. Tickets to Vega. Scope adds. |
| Wren | QA: stability, regressions, edge cases. Reports to Reed. | Game code. Gun-feel. Clearing crashes as "random." |

Handoffs: specs/tickets → Vega only. Test assignments → Pike + Wren (same build). Status and scope changes → Zach.

## Fantasy candidates (Zach picks one)

1. **Iron Room** — Fluorescent killing floor, one heavy rifle that kicks like it hates you. You stay for the next clean peek.
2. **Dustline** — Noon warehouse, dry snappy carbine, doorways as the whole map. You play to win the next angle.
3. **Hot Brass** — Indoor range that never closes. Recoil you can read, hits you can feel. You chase the next perfect string.

Locked: **Iron Saint** (evolved from Iron Room). Fluorescent killing floor, one heavy rifle that kicks. You stay for the next clean peek.

## Engine

**Default: Godot 4.3+ (4.x stable).** GDScript. Forward+ or Compatibility renderer; Compatibility until we have a reason.

Why: v0 is mouse look, a character body, and a room. Godot ships those as boring primitives, no seat license, and a project file testers can open from a README. Unity wins if we already live in its asset pipeline; we don't, and Hub/license/editor versioning is drag on day one. web/Three.js is the fastest "here's a URL," but pointer lock, frame pacing, and input latency fight the product (FPS feel). We are not shipping a browser toy.

Do not rewrite the engine mid-slice.

## How we iterate

One iteration = one goal = one branch = one playable increment.
Max 7 tickets, ordered, no two tickets mean the same thing.
Every iteration writes: goal, acceptance criteria, not-this-time.
After testers report, Reed produces: (1) severity-ranked findings, (2) design notes, (3) code-review notes with file paths, (4) next ticket list.

Never: merge/publish/spend without Zach. Expand v0 into a full game. Accept "works on my machine" without a README run path.

## Iteration 0 — I-0

**Goal:** Bootable Godot 4 project. Walk and look in an empty enclosed room. A tester can run it from README alone.

**Build ID:** `I-0` (Vega assigns commit SHA when the branch exists).

**Acceptance criteria:**
- `godot` project opens on the stated 4.x version with zero missing-dependency dialogs.
- WASD moves the player on the floor. Mouse look pitches and yaws. Pitch is clamped. Cursor captured in play.
- Player spawns in an enclosed arena (floor + walls). Cannot fall out of the world.
- README states engine version, how to open, how to run, how to quit, known issues.
- `STUDIO.md` lives at repo root.

**Not this time:** shoot, damage, die/respawn, sprint, jump, reload, HUD, audio, AI, second gun, second room, multiplayer, inventory, campaign, settings menu.

### Tickets (Vega). Ordered. Max 7.

**I0-1 Project skeleton**
Create the repo. Godot 4.x project at root. `.gitignore` for `.godot/`, imports, OS junk. Copy `/workspace/fps-studio/STUDIO.md` to repo root. Branch `iter/I-0`. Prefer GitHub; if `gh` is not authenticated, Origin via a new-repo cloud agent is acceptable and note the URL in README.
Done when: empty project opens in Godot 4.x and STUDIO.md is at root. Paste repo URL + engine version in the I-0 changelog.

**I0-2 Player controller**
First-person `CharacterBody3D`. WASD relative to facing. Walk speed only (no sprint). Gravity. No jump. No slide. Input actions named, not scancodes sprinkled in `_process`.
Done when: in play mode, WASD moves on the floor and stopping input stops movement without drift.

**I0-3 Camera**
Mouse look on the camera. Yaw on the body, pitch on the camera. Pitch clamp ~±89°. Sensible default sensitivity (documented in README). Raw mouse, no smoothing, no accel. Capture mouse on click; Esc releases.
Done when: you can look around, cannot flip the camera, Esc frees the cursor.

**I0-4 Empty arena**
One enclosed room. Floor, four walls, ceiling optional. Scale: ~20x20m walking space. Visible spawn. Collision on all bounds. Unlit/plain materials OK (contrast enough to see motion). No props required.
Done when: spawn is inside the room and walking any direction hits a wall, never a void.

**I0-5 Run instructions**
README: Godot 4.x exact version, clone, open project, F5/play, captured mouse, Esc, known issues. One-paragraph changelog for I-0. No "it works on my machine."
Done when: Pike or Wren could follow README without asking Vega a question.

## Test charter (Pike + Wren from I-1)

Use starting **Iteration 1**. I-0 is not a playtest. Do not guess a build.

Always: test only the build Reed names. Same commit for Pike and Wren. Cannot-run is S1; stop.

**Pike owns:** first 60 seconds of fun/readability. Movement weight, mouse feel, recoil, hit feedback, damage readability, HUD, death/respawn, "would I keep playing this room." Cover: walk, sprint, jump, look, shoot, reload, take damage, die, respawn, win the room. Note what is good. Feel findings need designer language, not "combat is mid."

**Wren owns:** crashes, softlocks, input edges, hitches, spawn/death, ammo/health underflow, camera clipping, pause/focus loss, windowed vs fullscreen, "does last iteration's promise still hold." Mash input. Look straight up/down. Shoot the floor. Empty mag. Die mid-reload. Alt-tab. Conflicting keys. Walk every corner. README wrong = bug. Keep a living regression list; re-run prior S1/S2 every iteration.

**Finding format:** title, severity (S1 blocker / S2 major / S3 polish), steps, expected vs actual. Pike labels feel vs function. Wren adds frequency (once / sometimes / always) and console/log if any.

**Do not:** ticket Vega. Expand scope. Duplicate the other tester's lane (Pike notes a crash in one line; Wren owns the deep pass). Argue feel vs broken in public; Reed decides.

I-1 focus: gun, hit, damage, die, respawn. Charter applies. Sprint/jump/reload: note absence, do not file as S1.

## Iteration 1 — I-1

**Goal:** Shoot a dummy, take damage, die, respawn. Same room. Same Godot 4.3 project.

**Build ID:** `I-1` (Vega assigns commit SHA on `iter/I-1`).

**Acceptance criteria:**
- Uncaptured LMB captures. Captured LMB fires a camera hitscan. Esc still releases.
- One dummy in the room, not on the spawn marker. 3 hits kill it. Hit flash is visible.
- Dummy returns fire on a fixed interval (no pathing). Player dies in 3 hits.
- Death auto-respawns at the orange marker after ~1s. Dummy resets alive.
- Minimal health number on screen (testability, not a menu).
- README covers fire / dummy / die / respawn. Changelog lists I-1 tickets.

**Not this time:** reload, ammo, sprint, jump, recoil, ADS, audio, particles beyond a color flash, second dummy, AI pathing, second room, settings menu.

### Tickets (Vega). Ordered.

**I1-1 Fire**
Named action `fire` = left mouse. If cursor is free, LMB captures and does not shoot. If captured, LMB hitscans from `Camera3D` forward, ~50m, one shot per press (no auto). No spread, no recoil, no ammo.
Done when: looking at the dummy and clicking while captured registers a hit. Looking at a wall does not.

**I1-2 Dummy**
One standing dummy in the arena, clearly not the spawn marker (~6–8m in front of spawn). Distinct mesh/color vs walls. Collision so hitscan and player can meet it. No walk, no animation required.
Done when: you can walk up to a readable target that is not the orange pad.

**I1-3 Hit and dummy death**
Hitscan vs dummy. 3 hits to kill. Visible hit flash on the dummy (material color is enough). At 0 HP dummy dies (collapse or hide collision+mesh). Dummy does not respawn until the player does.
Done when: three captured shots to the dummy kill it, and a fourth shot does not hit a living dummy.

**I1-4 Player damage**
Player has 3 HP. Dummy fires a hitscan at the player on a ~1s interval while both are alive. No navigation, no aim lead required (same room). A visible health integer (tiny label) updates. 0 HP is death, not underflow.
Done when: standing in front of a live dummy drains HP to 0 without shooting yourself.

**I1-5 Die and respawn**
On death: short (~1s) beat, then player at spawn marker, 3 HP, dummy alive at 3 HP, mouse stays captured. Spawn origin a couple cm above floor so the capsule is not coplanar with the floor top (see I-0 CR).
Done when: die, appear on the orange marker, dummy is shootable again.

**I1-6 README**
Exact Godot 4.3. How to fire, how dummy return-fire works, die/respawn. I-1 changelog + known issues. Branch `iter/I-1` from I-0 HEAD `d15eeb7`.
Done when: Pike/Wren can run I-1 from README with no questions to Vega.

## Current state

| Field | Value |
| --- | --- |
| Date | 2026-08-28 |
| Iteration | I-0 assigned (official kickoff) |
| Name | Iron Saint |
| Engine | Godot 4.3 (GDScript, GL Compatibility) |
| Repo | https://github.com/zachmofo/fps-studio |
| Branch | `iter/I-0` |
| Build | pending push SHA |
| Blockers | none |

Next: Vega pushes `iter/I-0`. Pike/Wren idle until Reed names an I-1 SHA. I-1 tickets below are preview, not assigned.
