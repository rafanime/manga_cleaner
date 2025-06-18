echo "📥 Converting PDF to grayscale TIFF pages..."

pdftoppm -gray -r 600  -scale-to-x 2000 -scale-to-y 2600 -tiff "Monster Volume 11 - PDF Room.pdf" tmp

# # 1. Clean function defined first
clean_page() {
  img="$1"
  base=$(basename "$img").png
  magick "$img" \
    -define png:compression-level=1 \
    -colorspace Gray \
    -morphology Close Diamond:1 \
    -blur 1x0.5 \
    -level 20%,95% \
    -sharpen 0x3 \
    -fuzz 5% -trim +repage \
    -resize 1264x1680\! \
    "cleaned/$base"
}

# 2. Prepare environment
mkdir -p cleaned
export -f clean_page

# 3. Run cleaning in parallel (on .tif files, not .png)
find . -name 'tmp-*.tif' | parallel --bar clean_page

# echo "🗜️ Recombining into final PDF..."
# img2pdf cleaned/*.tif -o "kindle_cleaned.pdf"

# echo "🧹 Cleaning up temporary files..."
rm tmp-*.tif
# rm cleaned/*.tif
# rmdir cleaned

# echo "✅ Done! Output file: kindle_cleaned.pdf"
