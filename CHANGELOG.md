# Changelog

## I-16 — 2026-09-05

Branch `iter/I-16` from `c32923d`. Bright spit on every crack.

- I16-1 World impact: 4–8 unshaded spheres at hit, Color(1.0,0.75,0.25)→(0.6,0.35,0.1), life 0.12–0.18s, spread ~0.15m. No decals.
- I16-2 Cover crate hit: same sparks + one darker fleck Color(0.25,0.25,0.22).
- I16-3 Dummy hit: white flash ≥0.2s kept; +3–5 orange sparks ~(1.0,0.55,0.12) 0.10–0.15s; bigger pop on kill. Eyes stay red.
- I16-4 Timed MeshInstance + unshaded materials (Compatibility). No blood/brass/HUD VFX.
- I16-5 Player muzzle / tip left_frac / kick / room / return-fire / CLEARED: no regress.
- I16-6 README `iter/I-16`. STUDIO.md = I-16. CHANGELOG.

## I-15 tip fix2 — 2026-09-05

Stay on `iter/I-15` from `8285fca`. Wren: tip left of + but left_frac≈5.24% (need 8–12%).

- I15F2-1 Tip further left; idle left_frac ∈ [0.08, 0.12]. Chunky lower-right kept.
- I15F2-2 Muzzle stays on tip.
- I15F2-3 Kick / mag / room / return-fire unchanged.
- I15F2-4 Named SHA + CHANGELOG.

## I-15 tip fix — 2026-09-05

Stay on `iter/I-15` from `082de37`. Wren S2: tip was right of HUD +.

- I15F-1 Idle tip below + and ~8–12% left of screen center (yaw/offset). Chunky silhouette kept.
- I15F-2 Muzzle flash still on barrel tip.
- I15F-3 Kick / mag / reload / sprint-cancel unchanged.
- I15F-4 Room / return-fire / CLEARED: no regress.
- I15F-5 README + CHANGELOG.

## I-15 — 2026-09-05

Branch `iter/I-15` from `f6d4ede`. Chunky Iron Saint viewmodel.

- I15-1 Dark heavy rifle FOV: long receiver + thick barrel, Color(0.10,0.10,0.12), rail edge (0.22,0.22,0.24), iron block sight. Tip clears HUD reticle (~8–12% left of center).
- I15-2 Camera kick 1.8° / ±0.35° / 0.18 s. Rifle mesh kick ~5° down-back + 1.5 cm toward camera. Fire cancels sprint. Mag 10 / reload 1.2 s.
- I15-3 Muzzle Color(1.0,0.55,0.12) r0.09, 0.09 s at barrel tip.
- I15-4 Room dress + return-fire + CoverMid/humanoid/CLEARED: no regress.
- I15-5 README clone path is `iter/I-15`. STUDIO.md current state is I-15.

## I-14 — 2026-09-05

Industrial room dress. Branch `iter/I-14` from `3203c8f`.

## I-13 — 2026-09-05

Return-fire proof. Pike lock gun/muzzle/hit flash.

## I-12 — 2026-09-05

Humanoid silhouette + red eyes.

## I-11 — 2026-09-05

Concrete floor, industrial walls, metal crates, flush strips.
