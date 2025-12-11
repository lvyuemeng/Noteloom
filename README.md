# Notes

This repository is a collection of notes and documents (kernel experiments, physics notes, Typst sources, and small utilities). Some content is published to [`nexus`](https://lvyuemeng.github.io/Nexus-Blog); the `kernel/` section is commonly posted.

## Quick Layout (recommended)

- `kernel/` — OS/kernel notes and experiments. Many subfolders are mounted into the Hugo site.
- `physics/` — long-form markdown and generated HTML pages.
- `typst/` — Typst sources, thesis and templates (`typst/*/main.typ`, `typst/mine/templates`).
- `clutter/` — misc notes and sketches.
- `static/` — site static assets.

## How the site is assembled

This project uses Hugo with module mounts configured in `config.toml`. Top-level folders (for example `kernel/arceos/axembassy` and `kernel/ipc`) are mounted into the site via `[[module.mounts]]` entries. Do not expect an editable `content/` directory — edit the top-level source folders instead.

Example mount (in `config.toml`):

```toml
[[module.mounts]]
source = "kernel/ipc"
target = "content/posts/nostalgia"
```

To add a new post that appears on the site:

- Create your post under a top-level folder, e.g. `kernel/new-topic/my-post.md`.
- Add or update a `[[module.mounts]]` entry in `config.toml` mapping the source folder (or file) to a `content/` target the site expects.
- Run a local preview with `hugo server -D`.

## Templates and Typst

- Typst templates and bibliographies live under `typst/mine/` and `typst/*/refs.bib` — update those when changing PDF templates or references.
- To compile a Typst document locally:

```bash
typst compile typst/<path>/main.typ
```

If you want to add a Hugo template or layout, add files under the theme or `layouts/` used by Hugo. Keep templates small and reference them in posts with front matter when needed.

## Developer workflows

- Local preview (requires Hugo installed):

```bash
hugo server -D
hugo --minify    # build static site
```

- Go toolchain: a `go.mod` exists at the project root; some tools or modules may require a Go toolchain (`go 1.25.1` specified).

## Notes for contributors and agents

- Preserve author voice and Chinese/technical comments when editing notes. Prefer small, content-preserving edits unless asked to rewrite.
- For site changes, edit top-level source folders and update `config.toml` mounts rather than creating `content/` files directly.
- See `.github/copilot-instructions.md` for AI-agent-specific guidance.