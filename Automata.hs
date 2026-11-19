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
crearAutomata ancho numRegla = error "Pendiente: implementar crearAutomata"

-- 3. Función 1: Transforma una vecindad de 3 bits a un entero (0 al 7)
vecindadAEntero :: (Bool, Bool, Bool) -> Int
vecindadAEntero vecindad = error "Pendiente: implementar vecindadAEntero"

-- 4. Función 2: Dado el entero (0 a 7) y el número de regla (0 a 255),
-- determina el nuevo valor booleano de la celda
consultarBit :: Int -> Int -> Bool
consultarBit posRegla numRegla = error "Pendiente: implementar consultarBit"

-- 5. Función 3: Transición de un estado a otro recorriendo la lista
-- Aplica los bordes periódicos y genera una nueva generación del autómata
paso :: Automata -> Automata
paso auto = error "Pendiente: implementar paso"

-- 6. Función 4: Formateo visual
-- Convierte el estado actual del autómata o su lista de [Bool] a String ('#' y ' ')
renderizar :: Automata -> String
renderizar auto = error "Pendiente: implementar renderizar"
