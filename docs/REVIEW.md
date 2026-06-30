# Review

Use reviews to find correctness, maintainability, validation, and documentation risks. Findings should come before summary.

## Severity

- `Critical`: breaks builds, corrupts data, creates serious security/safety risk, or invalidates core workflow.
- `High`: likely runtime bug, broken test behavior, incorrect dependency/build logic, or major regression.
- `Medium`: maintainability issue, missing validation, stale documentation, or risky edge case.
- `Low`: minor clarity, consistency, or follow-up improvement.

## Checklist

- Inspect the diff and nearby files.
- Check behavior changes against tests.
- Check CMake changes against `docs/CMAKE.md` and `docs/VALIDATION.md`.
- Check dependency changes against `docs/DEPENDENCIES.md`.
- Check style-sensitive changes against `docs/CONVENTIONS.md`.
- Check agent guidance changes against `.agents/`, `.codex/config.toml`, `.codex/`, and `docs/AI_WORKFLOW.md`.
- Confirm generated files remain ignored.
- Confirm `.vscode/` remains portable and editor-focused.

## Output Format

```md
## Findings

- Severity: file:line
  Describe the issue, impact, and suggested fix.

## Questions

- Open questions or assumptions, if any.

## Validation

- Commands reviewed or recommended.

## Summary

- Brief change summary only after findings.
```

If there are no findings, say so directly and mention any remaining test gaps or residual risk.
