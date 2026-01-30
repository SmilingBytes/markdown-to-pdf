# Markdown to PDF Converter

A shell script function that converts Markdown files into beautiful, polished PDFs with syntax highlighting and professional styling (inspired by GitHub and One Dark themes).

## Features

- **Beautiful Themes**: Support for professional Light (GitHub-style) and Dark (One Dark-style) modes.
- **Syntax Highlighting**: Full color-coded code blocks.
- **Table Support**: Clean, bordered tables with alternating row colors.
- **Professional Typography**: Optimized font sizes (9.5pt) and line heights (1.6).
- **Table of Contents**: Optional TOC support.
- **Hard Line Breaks**: Preserves single newlines from Markdown in the PDF output.
- **Dark Mode Perfection**: Full-page dark background (no white margins).

## Prerequisites

The script requires **Pandoc** and **WeasyPrint**.

### Arch Linux
```bash
sudo pacman -S pandoc python-weasyprint
```

### Ubuntu / Debian
```bash
sudo apt update
sudo apt install pandoc weasyprint
```

---

## Installation & Setup

### Option 1: One-Step Installation (Recommended)

Run this command in your terminal to automatically download the script and configure your shell (`zsh` or `bash`):

```bash
curl -fsSL https://raw.githubusercontent.com/SmilingBytes/markdown-to-pdf/main/install.sh | bash
```

### Option 2: Manual Sourcing
Save `markdown_to_pdf.sh` to a directory (e.g., `~/.config/shell-functions/`) and add this to your `.zshrc` or `.bashrc`:

```bash
# Add this to your ~/.zshrc or ~/.bashrc
source ~/.config/shell-functions/markdown_to_pdf.sh
```

### Option 3: Use as a standalone command
Make the script executable and move it to your PATH:
```bash
chmod +x markdown_to_pdf.md
sudo mv markdown_to_pdf.sh /usr/local/bin/markdown_to_pdf
```

---

## Usage

Once installed or sourced, use the command:

### Basic Conversion (Light Mode)
```bash
markdown_to_pdf document.md
```

### Dark Mode
```bash
markdown_to_pdf document.md dark
```

### With Table of Contents
```bash
# markdown_to_pdf <file> <mode> <toc_enabled>
markdown_to_pdf document.md light true
markdown_to_pdf document.md dark true
```

### Convenience Aliases
The script also provides these shorter aliases:
```bash
markdown_to_pdf_light document.md
markdown_to_pdf_dark document.md
```
