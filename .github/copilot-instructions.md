# Copilot / AI agent instructions for Noteloom

This repo is a Hugo-based notes site with content authored in several top-level folders (kernel, physics, typst, clutter). Key facts for coding agents:

- **Site engine & mounts:** `config.toml` uses Hugo module mounts to include content from non-`content/` directories (example mounts: [config.toml](config.toml)). Treat top-level folders as source content.
- **Go module:** Project root has `go.mod` (module: `github.com/lvyuemeng/Noteloom`), so Go tooling may be present; Hugo-related builds may depend on an installed `hugo` binary or Go toolchain ([go.mod](go.mod)).

- **Major content areas:**
  - `kernel/` — OS/kernel notes and experiments (many posts are mounted into site); example: `kernel/arceos/axembassy` and `kernel/ipc` are mapped into site posts.
  - `physics/` — long-form markdown and HTML (e.g., `physics/sr.md`).
  - `typst/` — Typst documents and thesis sources (`typst/*`, `typst/*/main.typ`). Use the `typst` CLI to compile when needed.

- **Data & assets:** Charts, CSVs and images live under subfolders (e.g., `kernel/arceos/charts/*`). Do not alter raw experimental data unless instructed.

Agent behaviour and priorities
- Preserve author voice and factual content when editing notes. Many files contain technical exposition and Chinese comments; avoid major rewrites unless asked.
- For site changes, prefer editing source files under their top-level folders (kernel, physics, typst). Changes should remain compatible with Hugo module mounts in [config.toml](config.toml).
- Avoid running or modifying large binary/data files; suggest edits as pull requests and reference exact file paths.

Developer workflows (discoverable)
- Local preview (requires Hugo installed):

  - Serve locally: `hugo server -D` (preview drafts)
  - Build static site: `hugo --minify`

- Typst documents:

  - Compile a Typst file: `typst compile typst/<path>/main.typ`

Notes about patterns and conventions
- Files under top-level folders are treated as canonical sources and are mounted into `content/posts/nostalgia` (see module mounts in [config.toml](config.toml)). Don't expect an editable `content/` directory — editing top-level source folders is correct.
- Typst templates and bibliographies are stored under `typst/mine/` and `typst/*/refs.bib` — update bibliography files there.
- Kernel notes often include code-like snippets and linker/Rust conventions (see `kernel/rCore/*`). When editing code fragments, preserve code fences and language hints.

Integration points & external dependencies
- `hugo` (site generator) — used implicitly by `config.toml` module mounts. Agents should recommend installing the Hugo binary for local preview.
- `typst` — for compiling `.typ` sources.
- Go toolchain may be required if the repo expects building modules from source; `go` version appears in [go.mod](go.mod).

Examples to reference while working
- Add a post under `kernel/ipc/` and it will appear on the site because `kernel/ipc` is mounted in [config.toml](config.toml).
- Use `typst/` templates when rendering PDFs; see `typst/mine/templates` and `typst/am-thesis/main.typ` for patterns.

If unsure, ask the human owner before:
- modifying experimental data files under `kernel/arceos/charts/`
- making stylistic or content-preserving rewrites of technical notes

If you'd like, I can refine this further with specific examples or add automated checks (build/test snippets) — tell me which area to expand. 
