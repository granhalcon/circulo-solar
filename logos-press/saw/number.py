import os
import re

directorio = "."  # Carpeta donde están los archivos .md
contador = 0

# Expresión regular para capturar el front matter
front_matter_regex = re.compile(r'^---\n(.*?)\n---\n', re.DOTALL)

for archivo in sorted(os.listdir(directorio)):
    if archivo.endswith(".md"):
        ruta_completa = os.path.join(directorio, archivo)

        with open(ruta_completa, "r", encoding="utf-8") as f:
            contenido = f.read()

        # Extraer el front matter
        match = front_matter_regex.search(contenido)
        if match:
            front_matter = match.group(1)
            restante = contenido[match.end():]

            # Formatear ID como 001, 002...
            id_str = f"{contador:03d}"

            # Actualizar o añadir 'id'
            if re.search(r'^number:.*$', front_matter, re.MULTILINE):
                front_matter = re.sub(r'^number:.*$', f'number: {id_str}', front_matter, flags=re.MULTILINE)
            else:
                front_matter += f"\nnumber: {id_str}"

            # Recomponer el archivo
            nuevo_contenido = f"---\n{front_matter}\n---\n{restante}"

            with open(ruta_completa, "w", encoding="utf-8") as f:
                f.write(nuevo_contenido)

            print(f'{archivo} → number: "{id_str}"')
            contador += 1