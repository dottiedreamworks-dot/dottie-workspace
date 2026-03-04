---
name: stakk
description: Generate beautiful presentations, landing pages, and documents. Convert ideas into visual, shareable formats (HTML slides, one-pagers, Markdown exports, or PDFs). Includes modern slide layouts, prebuilt component blocks, brand-consistent theming, and smart image handling.
inputs:
  - name: content
    type: text
    required: true
    description: The content to convert (markdown, outline, or detailed text)
  - name: format
    type: choice
    required: false
    description: Output format for the presentation
    choices:
      - html-slides
      - markdown-slides
      - landing-page
      - document
      - pdf
    default: html-slides
  - name: style
    type: choice
    required: false
    description: Visual style/theme for the presentation
    choices:
      - minimal
      - bold
      - elegant
      - playful
      - dark
      - light
    default: minimal
  - name: title
    type: text
    required: false
    description: Title of the presentation
outputs:
  - type: file
    format: html|md|pdf
    description: The generated presentation file
examples:
  - inputs:
      content: "My product pitch: A productivity app for busy moms..."
      format: html-slides
      style: elegant
      title: "MomFlow App Pitch"
    output: pitch_deck.html
---

# Stakk - Presentation & Deck Creation

This skill converts your ideas into professional presentations and documents.

## Quick Start

```bash
# Generate HTML slides from markdown
openclaw skill run stakk --input content=my_outline.md --input format=html-slides

# Create a landing page
openclaw skill run stakk --input content=product_description.txt --input format=landing-page --input style=bold
```

## Scripts

| Script | Description |
|--------|-------------|
| `scripts/generate.py` | Main generation engine (HTML, MD, PDF output) |
| `scripts/themer.py` | Apply consistent branding & themes |
| `scripts/export.py` | Export to various formats |

## Formats

- **html-slides**: Modern HTML presentation with slide navigation
- **markdown-slides**: Markdown-based slides (compatible with reveal.js, etc.)
- **landing-page**: Single-page website/document layout
- **document**: Long-form document layout
- **pdf**: PDF export (via headless browser)

## Styles/Themes

- **minimal**: Clean, lots of whitespace, elegant typography
- **bold**: High contrast, big typography, strong colors
- **elegant**: Sophisticated, refined, premium feel
- **playful**: Fun, colorful, approachable
- **dark**: Dark mode optimized
- **light**: Light mode optimized

## Assets

- `assets/templates/` - Pre-built slide and page templates
- `assets/fonts/` - Web font files
- `assets/image-assets/` - Placeholder and decorative images
- `assets/icons/` - Icon set (Lucide-style)

## References

- `references/design-principles.md` - Design system documentation
- `references/component-library.md` - Available UI components
- `references/export-formats.md` - Export format specifications