# Uso de la plantilla de portada (SVG)

Esta plantilla genera una portada en formato SVG de 1600×2560 px y toma el `title` y `author` desde el front matter de tus archivos Markdown.

Archivos creados:

- `_includes/cover.svg` — plantilla SVG reutilizable.

Formas de usarla:

1) Incluir la portada directamente dentro de una página (incrusta el SVG en el HTML):

```liquid
{% raw %}{% include cover.svg title=page.title author=page.author %}{% endraw %}
```

Esto insertará el SVG en el HTML generado, y verá el título y autor según el front matter del post.

2) Usarla como `img` (data URI). Ten en cuenta que algunos caracteres y saltos de línea pueden requerir codificación. Un ejemplo sencillo:

```liquid
<img alt="Portada" src="data:image/svg+xml;utf8,{% raw %}{% include cover.svg title=page.title author=page.author %}{% endraw %}">
```

Advertencias y notas:

- La plantilla usa `<foreignObject>` para permitir el ajuste de texto (wrapping) con CSS; algunos convertidores a PNG o visores antiguos podrían no renderizar `foreignObject`. Si necesitas convertir a PNG (por ejemplo, para redes sociales), puedo añadir una variante sin `foreignObject` o un script de generación (e.g., Puppeteer) que renderice la página y guarde la imagen.

- Fuentes: la plantilla usa fuentes genéricas (`Georgia`, `Times`, `Arial`). Si quieres usar las fuentes del sitio (por ejemplo, SourceSerifPro), puedo actualizar la plantilla para referenciar los archivos de fuente del proyecto o a Google Fonts.

- Si prefieres que cada post tenga su propio archivo `/covers/<slug>.svg`, puedo crear un layout `cover` que genere un SVG por post y usar `permalink` para publicarlos automáticamente.

Si quieres, creo también el layout que publica un `.svg` por cada post (lista automática) o una acción para exportar `.png` listo para compartir.