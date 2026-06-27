# Security Policy

## Scope

This repository primarily contains scripts, configuration files, documentation,
and delivery-support assets for SKY130 memory generation workflows. It is not a
hosted production service, but security-sensitive issues can still exist in:

- automation scripts
- packaging logic
- path handling
- file parsing
- credential or environment handling

## Reporting a Vulnerability

Please do not open a public issue for a suspected security problem.

Instead, report it privately to the repository owner and include:

- a short summary
- affected files or paths
- impact description
- reproduction steps, if safe to share
- suggested mitigation, if known

If the issue involves credentials, private infrastructure, or internal delivery
artifacts, do not paste secrets into GitHub issues or pull requests.

## Response Expectations

The maintainer will review the report, confirm impact, and decide whether the
fix should be handled privately first or directly in the repository.

## Supported Content

Security review is best-effort for repository-authored content such as:

- `scripts/`
- `configs/`
- repository metadata and documentation

Upstream third-party material kept under `repo_extracts/OpenRAM-stable/` follows
its own upstream maintenance and disclosure practices.
