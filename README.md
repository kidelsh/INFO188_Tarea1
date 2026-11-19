# INFO188 - Tarea 1: Autómata Celular Elemental 1D

Implementación en Haskell de un autómata celular elemental unidimensional con condiciones de borde periódicas y reglas de Wolfram (0 a 255).

- **Curso:** INFO188
- **Profesor:** Cristóbal A. Navarro
- **Año:** 2026

## Requisitos

- Compilador **GHC** (Glasgow Haskell Compiler) instalado.
- Utilidad **Make**.

## Estructura del Proyecto

- `Main.hs`: Punto de entrada del programa. Procesa los argumentos de línea de comandos, inicializa el autómata y controla el ciclo de impresión por consola.
- `Automata.hs`: Define el tipo de dato `Automata`, la creación del estado inicial, el cálculo de vecindades con bordes periódicos, la evaluación de las reglas de Wolfram mediante operaciones a nivel de bits (`Data.Bits`), la transición de estado (`paso`) y el formateo visual (`renderizar`).
- `Makefile`: Automatiza la compilación del binario `prog` y la limpieza de archivos intermedios.

## Compilación

Para compilar el proyecto y generar el ejecutable `prog`, ejecuta:

```bash
make
./prog <regla> <ancho> <generaciones>
