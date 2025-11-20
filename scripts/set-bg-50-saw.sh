#!/bin/bash

# Por cada archivo markdown en el directorio
for file in logos-press/saw/[0-9][0-9][0-9].md; do
    # Obtener el número del nombre del archivo
    num=$(basename "$file" .md)
    echo "Procesando $file (número $num)..."
    
    # Reemplazar las imágenes con el número correcto
    sed -i "s|cover-image: docs/assets/images/saw/cover/[0-9][0-9][0-9].jpg|cover-image: docs/assets/images/saw/cover/$num.jpg|" "$file"
    sed -i "s|media-image: /docs/assets/images/saw/[0-9][0-9][0-9]-media.jpg|media-image: /docs/assets/images/saw/$num-media.jpg|" "$file"
    sed -i "s|social-image: /docs/assets/images/saw/[0-9][0-9][0-9]-social.jpg|social-image: /docs/assets/images/saw/$num-social.jpg|" "$file"
done

echo "Nombres de imágenes actualizados."
