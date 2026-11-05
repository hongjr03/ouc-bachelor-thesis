# AGENTS.md

This file provides guidance to agents working on this repository.

## Project Overview

This is an unofficial Typst template for Ocean University of China (OUC), based on the official OUC thesis writing specification. It is packaged as a Typst Universe package named `unofficial-ouc-bachelor-thesis` (version VERSION, currently 0.3.1, MIT licensed). All `VERSION` occurrences below should be replaced with the concrete version.

## Key Commands

- **Package the Typst Universe package:** `just package target=@local` — copies files, strips the GitHub warning from README, sets thumbnail, and produces a versioned package directory.
- **Compile a thesis from the template:** `typst compile main.typ` (run inside the `template/` directory after `typst init`).
- **Install the template from Typst Universe:**
  - `typst init @preview/unofficial-ouc-bachelor-thesis:VERSION`.
  - For an existing Typst document, simply add the `#import "@preview/unofficial-ouc-bachelor-thesis:VERSION": project` line — Typst will install the package automatically on compile.

## Architecture

### The `project` Function

The public API is a single `project` function exported from `template.typ`. After importing it, use `#show: project.with(...)` to render the entire thesis. It takes:

- `title` — `(zh: string | string[], en: string)` — Chinese title (string or array for multi-line) and English title
- `author` — `(name: string, id: string)`
- `advisor` — `string | string[]`
- `college`, `department` — strings
- `defense-date` — `datetime`
- `abstract` — `(zh: content, en: content)`
- `keywords` — `(zh: string[], en: string[])`
- `bibliography` — content (typically `read("references.bib")`)
- `acknowledgments` — content
- `appendix` — content (optional, omit or empty for no appendix)
- `config` — dictionary with optional `fonts` and `numbering` overrides

It renders the cover, abstract, table of contents, body, bibliography, acknowledgments, and appendix in sequence.

### Font System

`utils/fonts.typ` defines the default font mapping:
- 宋体 (SimSun) — body text
- 黑体 (SimHei) — headings
- 楷体 (KaiTi) — special text (e.g., university name on cover)
- 仿宋 (FangSong) — used in some contexts
- 西文 (Times New Roman) — Latin text
- 数学 (New Computer Modern Math) — math
- 等宽 (Consolas, etc.) — code blocks

Internal function `setup-fonts()` adds Latin-in-CJK fallback so that Chinese fonts render Latin characters correctly. Users can override any font via `config.fonts`.

### Numbering System

`utils/chapnum.typ` implements chapter-aware numbering. Figures, tables, and equations are numbered as `chapter-number.item-number` (e.g., `1-1`, `2-3`). The config format is `(selector, target-element, format-string)`. The appendix automatically remaps chapter number `1` to `A` for its own numbering.

### Style System

`utils/style.typ` contains two style functions:
- `global-style` — applied to front matter (cover, abstract, outline): sets fonts, paragraph indentation, heading styles, figure numbering
- `apply-style` — applied to body content: sets page headers/footers, heading numbering, three-line tables, code block styling (zebraw), figure caption positioning, and table continuation

### Three-Line Tables

`utils/three-line-table.typ` automatically converts any `table` into a three-line table (top rule, header rule, bottom rule) with automatic "续表" (continuation table) headers when tables span multiple pages.

## Font Install

Non-Windows users must install the [Chinese font pack](https://github.com/hongjr03/assets/releases/download/cn-thesis-fonts-2.1-f0dde462e435/cn-thesis-fonts-2.1-f0dde462e435.zip) before compiling. For typst.app, download the same pack, extract it, and upload the fonts directly into the thesis folder.

