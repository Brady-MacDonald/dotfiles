---
name: pr-review
description: Review the current Git branch against main for correctness, regressions, security, performance, and maintainability issues
---

# Pre-Merge Code Review

## Objective

Determine whether the current branch can safely be merged into `main`.

The review must focus on defects introduced by the current branch.

Do not treat the review as a general code-quality audit of the entire repository.

Be strict: prefer a small number of high-confidence findings over many weak ones.

## Phase 1 — Establish the change

Determine:

- Current branch
- Target branch
- Merge base
- Files changed
- Commits included
- Overall purpose of the change

Use Git to inspect the actual merge diff, not the working tree.

Prefer:

git diff main...HEAD

over comparing working-tree state against main.

If the working tree is dirty, ignore unrelated local edits unless they affect the
same lines under review.

Also inspect relevant commits when necessary to understand intent.

## Phase 2 — Understand the affected system

Before reviewing individual changes:

1. Identify the architectural component being modified.
2. Read relevant interfaces and abstractions.
3. Identify callers and consumers of changed code.
4. Identify persistence, external API, messaging, and caching boundaries.
5. Read relevant tests.
6. Read project-specific documentation and AGENTS.md.

Do not assume the changed file contains enough context.

## Phase 3 — Review for correctness

Look specifically for:

### Functional correctness

- incorrect business logic
- incorrect conditions
- missing cases
- incorrect defaults
- invalid assumptions
- incorrect state transitions
- null/empty handling
- boundary conditions

### Data and persistence

- incorrect queries
- missing filters
- incorrect joins
- N+1 queries
- transaction problems
- race conditions
- stale data
- incorrect concurrency assumptions
- migration compatibility

### APIs

- breaking changes
- incorrect HTTP semantics
- authentication/authorization problems
- validation gaps
- serialization problems
- backwards compatibility issues

### Async/concurrency

- race conditions
- deadlocks
- improper cancellation
- fire-and-forget work
- incorrect locking
- shared mutable state
- incorrect async usage

### Performance

Only report performance issues with a credible impact.

Look for:

- unnecessary database queries
- loading excessive data
- expensive loops
- repeated network calls
- blocking operations
- unbounded operations

### Security

Look for:

- authorization bypasses
- privilege escalation
- injection
- sensitive data exposure
- insecure deserialization
- improper validation
- secrets leakage

### Error handling

Look for:

- swallowed exceptions
- incorrect error recovery
- incorrect HTTP status codes
- partial failures
- inconsistent state
- retry problems

## Phase 4 — Test the reasoning

For each potential issue, verify all of the following before reporting it:

1. Determine whether it is actually introduced by this branch.
2. Trace the relevant execution path.
3. Identify the concrete failure scenario.
4. Check whether existing tests already prevent the issue.
5. If practical, run the relevant tests or validation commands.
6. Reject the finding if the evidence is insufficient.

Do not manufacture findings.

Prefer a finding only when you can point to the exact code path and the exact
behavior that breaks.

Common reasons to reject a candidate finding:

- The issue predates the branch.
- The code path is unreachable in practice.
- Existing validation already covers it.
- The impact is speculative or too minor to matter.

## Phase 5 — Report findings

Report only actionable issues.

Severity:

P0 — catastrophic/security-critical; merge must not happen.

P1 — serious correctness, security, data-loss, or production-impacting issue.

P2 — meaningful bug or regression that should be fixed.

P3 — minor issue with limited impact.

For every finding include:

- Severity
- File and line
- Problem
- Why it happens
- Concrete failure scenario
- Recommended fix

Order findings from highest to lowest severity.

Keep the report concise. If there are no high-confidence issues, do not pad the
response with observations, style notes, or general advice.

If no issues are found, explicitly state:

"No merge-blocking issues found."

Then summarize what was reviewed and what validation was performed.

## Output shape

Use this structure:

1. Findings, ordered by severity.
2. If no findings, the required no-issues statement.
3. Brief validation summary.

Do not include a separate summary of strengths unless explicitly asked.
