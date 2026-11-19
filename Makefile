# Compilador de Haskell
GHC = ghc
FLAGS = -O2

# Nombre del ejecutable final
TARGET = prog

# Archivos fuente
SOURCES = Main.hs Automata.hs

all: $(TARGET)

$(TARGET): $(SOURCES)
	$(GHC) $(FLAGS) -o $(TARGET) Main.hs

clean:
	rm -f *.o *.hi $(TARGET)

.PHONY: all clean
