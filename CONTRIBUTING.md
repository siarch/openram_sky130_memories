# Contributing

## Scope

This repository focuses on SKY130 memory generation assets, area closure support,
multi-tool output organization, and delivery packaging. Keep contributions
within that scope unless the change clearly improves repository maintenance.

## Before You Start

1. Read `AGENTS.md` for workspace rules and delivery constraints.
2. Read `CLAUDE.md` for process guidance and recovery expectations.
3. Keep local-only machine details out of commits. `CLAUDE.local.md` stays ignored.

## Change Guidelines

- Prefer small, reviewable commits.
- Avoid unrelated formatting churn.
- Do not rename or reintroduce deprecated delivery paths such as `dc/` for new outputs.
- Preserve upstream ownership boundaries for content under `repo_extracts/OpenRAM-stable/`.
- Keep generated or packaged artifacts out of changes unless the update is intentional and documented.

## Validation Expectations

Before opening a pull request, run the checks relevant to your change:

```bash
git st
python -m compileall scripts generated_openram_configs generated_openram_power_configs
for file in scripts/*.sh; do bash -n "$file"; done
```

If you touch YAML inputs, also validate them:

```bash
python -c "from pathlib import Path; import yaml; [yaml.safe_load(p.read_text(encoding='utf-8')) for p in Path('configs').glob('*.y*ml')]"
```

## Pull Request Notes

- Describe what changed and why.
- List the directories or scripts affected.
- Include validation evidence or explain why validation was not applicable.
- Call out any impact on deliverables, area summaries, or upstream extracted content.
