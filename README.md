# 🧼 PDF Cleaner & Pre-Formatter for Kindle Comic Converter

This repository contains a shell script to **clean and prepare PDFs** (e.g. scanned manga or comics) for conversion to eBook format using [Kindle Comic Converter (KCC)](https://github.com/ciromattia/kcc).

---

## 📋 What It Does

1. Converts the input PDF into high-resolution grayscale **TIFF images**, one per page.
2. **Cleans** each page using ImageMagick:
   - Applies grayscale, blur, and sharpening.
   - Trims whitespace.
   - Resizes to Kindle-friendly dimensions.
3. Stores the cleaned pages in a `cleaned/` folder.
4. This folder is ready to be passed into **Kindle Comic Converter** for final formatting into .mobi or .epub.

---

## 📝 Requirements

Make sure the following tools are installed on your system:

- [`pdftoppm`](https://poppler.freedesktop.org/) (part of Poppler)
- [`ImageMagick`](https://imagemagick.org/)
- [`parallel`](https://www.gnu.org/software/parallel/)
- (Optional) [`img2pdf`](https://github.com/josch/img2pdf) if you want to recombine images into a PDF


## 🧰 Install Dependencies

### Mac (Homebrew)

```bash
brew install poppler imagemagick parallel img2pdf
```

### Windows (Scoop)

```bash
scoop install poppler imagemagick gnu-parallel python
pip install img2pdf
```
---

## 📂 Folder & File Requirements

Before running the script:

- The **PDF file** must be in the same folder as the script.
- The **PDF name** must be written directly in the script (`pdftoppm` command).  
  Example:
  ```bash
  pdftoppm -gray -r 600 -scale-to-x 2000 -scale-to-y 2600 -tiff "Monster Volume 11 - PDF Room.pdf" tmp
