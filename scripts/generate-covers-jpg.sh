#!/bin/bash

# Directorio de salida para las imágenes
OUTPUT_DIR="_site/docs/assets/images/covers"
# Crear directorio si no existe
mkdir -p "$OUTPUT_DIR"

# Por cada archivo HTML en el directorio _site/l090s/cover/saw
for html_file in _site/l090s/cover/saw/*.html; do
    # Obtener el nombre base del archivo sin extensión
    base_name=$(basename "$html_file" .html)
    
    echo "Procesando $html_file..."
    
    # Exportar a JPG usando wkhtmltoimage
    wkhtmltoimage \
        --width 1600 \
        --height 2560 \
        --quality 100 \
        --format jpg \
        --enable-local-file-access \
        "$html_file" \
        "$OUTPUT_DIR/$base_name.jpg"
    
    echo "Creada portada: $OUTPUT_DIR/$base_name.jpg"
done

echo "Proceso completado!"