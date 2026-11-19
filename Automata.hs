module Automata
( Automata(..)
, crearAutomata
, vecindadAEntero
, consultarBit
, paso
, renderizar
) where

    import Data.Bits (testBit) -- Opcional: útil si usas testBit para consultarBit

    -- 1. Modelo del Autómata Celular
    data Automata = Automata
    { celdas     :: [Bool]
    , regla      :: Int
    , generacion :: Int
    } deriving (Show, Eq)

    -- 2. Inicialización
    -- Dado el ancho y el número de regla, crea el estado inicial (1 celda viva al centro)
    crearAutomata :: Int -> Int -> Automata
    crearAutomata ancho numRegla =
        let izq = ancho `div` 2
            der = ancho - izq - 1
            listaInicial = replicate izq False ++ [True] ++ replicate der False
        in Automata listaInicial numRegla 0

    -- 3. Función 1: Transforma una vecindad de 3 bits a un entero (0 al 7)
    vecindadAEntero :: (Bool, Bool, Bool) -> Int
    vecindadAEntero (a, b, c) = (if a then 4 else 0) + (if b then 2 else 0) + (if c then 1 else 0)

    -- 4. Función 2: Dado el entero (0 a 7) y el número de regla (0 a 255),
    -- determina el nuevo valor booleano de la celda
    consultarBit :: Int -> Int -> Bool
    consultarBit posRegla numRegla = error "Pendiente: implementar consultarBit"

    -- 5. Función 3: Transición de un estado a otro recorriendo la lista
    -- Aplica los bordes periódicos y genera una nueva generación del autómata
    paso :: Automata -> Automata
    paso (Automata lista r g) =
        let izq = last lista : init lista
            cen = lista
            der = tail lista ++ [head lista]
            tuplas = zip3 izq cen der
            nuevaLista = [consultarBit (vecindadAEntero x) r | x <- tuplas]
        in (Automata nuevaLista r (g + 1))

    -- 6. Función 4: Formateo visual
    -- Convierte el estado actual del autómata o su lista de [Bool] a String ('#' y ' ')
    renderizar :: Automata -> String
    renderizar (Automata [] _ _) = ""
    renderizar (Automata (x:xs) r g) =
        (if x then '#' else ' ') : renderizar (Automata xs r g)
