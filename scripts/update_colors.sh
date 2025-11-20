#!/bin/bash

# Definir los reemplazos de color
declare -A colors=(
    ["#ffffff"]="#1a1a1a"
    ["#f5fffa"]="#2e5d4f"
    ["#fffafa"]="#4a3636"
    ["#f5f5dc"]="#5c4a1f"
    ["#ffd700"]="#8b7355"
    ["#f0e68c"]="#8b814c"
    ["#ffff00"]="#8b8b00"
    ["#87cefa"]="#1e4b7a"
    ["#87ceeb"]="#204a87"
    ["#00ffff"]="#006666"
    ["#e6e6fa"]="#483d8b"
    ["#dda0dd"]="#8b008b"
    ["#ffb6c1"]="#8b3a62"
    ["#d3d3d3"]="#4a4a4a"
    ["#c0c0c0"]="#404040"
)

# Por cada archivo markdown en el directorio
for file in l090s/cover/saw/*.md; do
    echo "Procesando $file..."
    
    # Por cada color que necesita ser reemplazado
    for old_color in "${!colors[@]}"; do
        new_color="${colors[$old_color]}"
        # Reemplazar el color en el archivo
        sed -i "s/bg: \"$old_color\"/bg: \"$new_color\"/" "$file"
    done
done

echo "Todos los colores han sido actualizados."