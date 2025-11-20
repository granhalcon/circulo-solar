#!/bin/bash

# Directorio de salida para las imágenes
OUTPUT_DIR="_site/docs/assets/images/covers"
# Crear directorio si no existe
mkdir -p "$OUTPUT_DIR"

# Por cada archivo markdown en el directorio logos-press/saw
for md_file in logos-press/saw/*.md; do
    # Obtener el nombre base del archivo sin extensión
    base_name=$(basename "$md_file" .md)
    
    # Crear la portada SVG temporal con Jekyll
    echo "Procesando $md_file..."
    
    # Exportar a PNG usando Inkscape
    inkscape --export-type=png \
             --export-filename="$OUTPUT_DIR/$base_name.png" \
             --export-width=1600 \
             --export-height=2560 \
             --export-area-page \
             "_site/logos-press/saw/$base_name.html"
    
    echo "Creada portada: $OUTPUT_DIR/$base_name.png"
done

echo "Proceso completado!"