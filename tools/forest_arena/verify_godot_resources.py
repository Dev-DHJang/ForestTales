#!/usr/bin/env python3
import argparse,json
from pathlib import Path
ap=argparse.ArgumentParser(); ap.add_argument('--project-root',default='.'); args=ap.parse_args(); root=Path(args.project_root).resolve()
regp=root/'forest_arena/data/resource_registry.json'
if not regp.exists(): raise SystemExit('registry not found')
r=json.loads(regp.read_text(encoding='utf-8')); errs=[]
for a in r['assets']:
    if a.get('quality_dependent'):
        v=a.get('variants',{})
        if set(v)!={'high','medium','low'}: errs.append(a['id']+': variants')
        paths=v.values()
    else: paths=[a.get('path','')]
    for p in paths:
        if not p.startswith('res://forest_arena/'): errs.append(a['id']+': bad path '+p); continue
        if not (root/p.replace('res://','')).exists(): errs.append(a['id']+': missing '+p)
if (root/'project.godot').exists():
    txt=(root/'project.godot').read_text(encoding='utf-8',errors='ignore'); line='ForestArenaResources="*res://forest_arena/scripts/forest_arena_resource_manager.gd"'
    if line not in txt: errs.append('autoload missing')
if errs:
    print('FAILED'); [print(' -',e) for e in errs]; raise SystemExit(1)
print(f"OK: {len(r['assets'])} logical assets")
print(f"Quality-dependent assets: {sum(1 for a in r['assets'] if a.get('quality_dependent'))} (high/medium/low)")
