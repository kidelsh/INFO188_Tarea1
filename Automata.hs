module Automata
( Automata(..)
, crearAutomata
, vecindadAEntero
, consultarBit
, paso
, renderizar
) where

    import Data.Bits (testBit)

    -- 1. Modelo del Autómata Celular
    data Automata = Automata { celdas :: [Bool], regla :: Int, generacion :: Int } deriving (Show, Eq)

    -- 2. Inicialización (1 celda viva al centro)
    crearAutomata :: Int -> Int -> Automata
    crearAutomata ancho numRegla =
        let izq = ancho `div` 2
            der = ancho - izq - 1
            listaInicial = replicate izq False ++ [True] ++ replicate der False
        in Automata listaInicial numRegla 0

    -- 3. Transforma vecindad (Bool, Bool, Bool) a un entero (0 a 7)
    vecindadAEntero :: (Bool, Bool, Bool) -> Int
    vecindadAEntero (a, b, c) = (if a then 4 else 0) + (if b then 2 else 0) + (if c then 1 else 0)

    -- 4. Evalúa el bit de la regla de Wolfram en la posición dada
    consultarBit :: Int -> Int -> Bool
    consultarBit posRegla numRegla = testBit numRegla posRegla

    -- 5. Aplica bordes periódicos y avanza 1 generación
    paso :: Automata -> Automata
    paso (Automata lista r g) =
        let izq = last lista : init lista
            cen = lista
            der = tail lista ++ [head lista]
            tuplas = zip3 izq cen der
            nuevaLista = [consultarBit (vecindadAEntero x) r | x <- tuplas]
        in Automata nuevaLista r (g + 1)

    -- 6. Formateo visual (Bool -> '#'/ ' ')
    renderizar :: Automata -> String
    renderizar auto = map (\c -> if c then '#' else ' ') (celdas auto)
