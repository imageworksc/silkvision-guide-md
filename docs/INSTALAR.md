# Cómo instalar y usar la skill de Silk Vision en Claude

Esta guía es para cualquier persona del equipo, sepa programar o no. Te
toma unos 5 minutos.

**¿Qué es una skill?** Es un paquete de instrucciones que Claude carga
cuando lo necesita. Con esta skill instalada, Claude ya conoce los
colores, las tipografías, los componentes, los textos legales y los datos de
contacto de Silk Vision. Así, cualquier página nueva sale igual que la de
[Ziplyft](https://imageworksc.github.io/silkvision-ziplyft/).

Elige **una** de las dos opciones:

| Usas… | Sigue |
| --- | --- |
| claude.ai en el navegador o la app de escritorio de Claude | [Opción A](#opción-a--claudeai-o-la-app-de-escritorio-sin-código) (sin código) |
| Claude Code (terminal, VS Code o la pestaña Code de la app) | [Opción B](#opción-b--claude-code) |

---

## Opción A — Claude.ai o la app de escritorio (sin código)

### 1. Descarga el archivo

Haz clic aquí para descargarlo:
**[silkvision-design.zip](https://github.com/imageworksc/silkvision-guide-md/raw/main/silkvision-design.zip)**

⚠️ **No lo descomprimas.** Claude necesita el `.zip` tal cual.

### 2. Activa las skills en tu cuenta

1. Entra en [claude.ai](https://claude.ai) (o abre la app).
2. Abre **Settings (Configuración)**. Está en tu nombre o tu inicial, abajo
   a la izquierda.
3. Ve a **Capabilities (Capacidades)**.
4. Activa **Code execution and file creation** (ejecución de código y
   creación de archivos). Sin esto las skills no funcionan.

### 3. Sube la skill

1. En esa misma página, baja hasta **Skills**.
2. Pulsa **Upload skill (Subir skill)**.
3. Elige el archivo `silkvision-design.zip` que descargaste.
4. Comprueba que **silkvision-design** aparece en la lista y está
   **activada** (el interruptor en azul).

> Si usas un plan Team o Enterprise y no ves la opción, pide a quien
> administra la cuenta que active las skills para la organización.

### 4. Pruébala

Abre un chat nuevo y escribe:

```
Usa la skill silkvision-design y dime qué secciones lleva una página de procedimiento de Silk Vision.
```

Si te responde con el hero, la barra de datos, el FAQ, el cierre, etc., ya
está funcionando ✅

---

## Opción B — Claude Code

### Para ti (todos tus proyectos)

Copia y pega en la terminal:

```bash
git clone https://github.com/imageworksc/silkvision-guide-md.git ~/.claude/skills/silkvision-design
```

### Solo para un proyecto (y todo el equipo de ese repo)

Desde la carpeta del proyecto:

```bash
git clone https://github.com/imageworksc/silkvision-guide-md.git .claude/skills/silkvision-design
```

Después abre una sesión **nueva** de Claude Code y escribe `/skills`. Debe
aparecer **silkvision-design**.

**Sin git?** Descarga el
[zip](https://github.com/imageworksc/silkvision-guide-md/raw/main/silkvision-design.zip),
descomprímelo y mueve la carpeta `silkvision-design` a
`~/.claude/skills/` (en Mac, `~` es tu carpeta de usuario; en Windows es
`C:\Users\TU-USUARIO\.claude\skills\`).

---

## Cómo crear una página nueva

### Paso 1 — Prepara el contenido

Tienes tres caminos, el que te quede más fácil:

- **Rellena el formulario:**
  [templates/content-brief.md](../templates/content-brief.md). Cópialo,
  completa lo que tengas y deja en blanco lo demás.
- **Pega tu documento:** el texto de Word o Google Docs con el copy de la
  página.
- **Da el link de la página actual** de silkvision.net que vas a rehacer.

### Paso 2 — Pídeselo a Claude

Ejemplos que puedes copiar:

```
Construye la página de LASIK de Silk Vision con la skill silkvision-design.
Aquí está el contenido: [pega el texto o adjunta el formulario]
```

```
Rehaz esta página con el diseño de Silk Vision:
https://www.silkvision.net/cataract-surgery-and-cataract-removal
```

```
Agrega una sección de "Recuperación" a esta página de Silk Vision con estos datos: …
```

```
Revisa esta página contra el sistema de diseño de Silk Vision y dime qué no cumple.
```

### Paso 3 — Revisa lo que entrega

- Claude primero te muestra el **esquema de secciones**. Corrige ahí si algo
  sobra o falta.
- Los datos que no le diste (precio, fotos…) quedan como **marcadores
  visibles** del tipo `[Add approved price]`. Nunca los inventa.
- Recibes una carpeta con `index.html`. Ábrelo en el navegador para verlo.

### Paso 4 — Publicar (para quien maneja GitHub)

1. Crea el repo `imageworksc/silkvision-<pagina>` y sube la carpeta.
2. Activa **Settings → Pages → Deploy from branch → main / root**.
3. La página queda en `https://imageworksc.github.io/silkvision-<pagina>/`.

---

## Actualizar la skill

- **Claude.ai:** descarga el zip otra vez, borra la skill vieja en
  Settings → Skills y sube la nueva.
- **Claude Code:** `git -C ~/.claude/skills/silkvision-design pull`

## Problemas frecuentes

| Problema | Solución |
| --- | --- |
| No veo "Skills" en Settings | Activa *Code execution and file creation* en Capabilities. En un plan de empresa, pide al administrador que active las skills. |
| "Invalid skill" al subir | Sube el `.zip` tal como se descargó, sin descomprimirlo ni volver a comprimirlo. |
| Claude no usa la skill | Nómbrala en el mensaje ("usa la skill silkvision-design") y revisa que esté activada. |
| En Claude Code no aparece en `/skills` | Abre una sesión nueva y comprueba que exista `~/.claude/skills/silkvision-design/SKILL.md`. |
