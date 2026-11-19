module Main where

import System.Environment (getArgs)
import Automata

-- Función 5: Recorre y ejecuta las N generaciones imprimiendo cada paso
ejecutarSimulacion :: Int -> Automata -> IO ()
ejecutarSimulacion limiteGen auto
  | limiteGen <= 1 = putStrLn (renderizar auto)
  | otherwise      = do
    putStrLn (renderizar auto)
    ejecutarSimulacion (limiteGen - 1) (paso auto)

main :: IO ()
main = do
      args <- getArgs
      case args of
           [strRegla, strAncho, strGeneraciones] -> do
             let numRegla = read strRegla :: Int
                 ancho = read strAncho :: Int
                 generaciones = read strGeneraciones :: Int

             let estadoInicial = crearAutomata ancho numRegla

             ejecutarSimulacion generaciones estadoInicial

           _ -> putStrLn "Uso: ./prog <regla> <ancho> <generaciones>"
