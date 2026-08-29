# Changelog

## I-1 — 2026-08-28

**Engine:** Godot 4.3 (GDScript, GL Compatibility)
**Repo:** https://github.com/zachmofo/fps-studio
**Branch:** `iter/I-1`
**Name:** Iron Saint

### Tickets

- **I1-1** Fire — uncaptured LMB captures only; captured LMB is `fire`, camera hitscan ~50 m, one shot per press.
- **I1-2** Dummy — standing dummy ~7 m in front of spawn, rust-red capsule, collision, no walk.
- **I1-3** Hit + dummy death — 3 HP, white flash, hidden at 0 until player respawns.
- **I1-4** Player damage — 3 HP, dummy hitscan ~1 s, HP label, 0 = death no underflow.
- **I1-5** Die/respawn — ~1 s, spawn lifted 5 cm, 3 HP both, mouse stays captured.
- **I1-6** README + deleted RTF `studio.md`.

### Known issues

- No reload/ammo/sprint/jump/recoil/ADS/audio/cover.
- Dummy does not path or lead.
- Editor F5 only.

## I-0 — 2026-08-28

Walk + look in an enclosed room. See `iter/I-0`.
