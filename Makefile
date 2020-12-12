CXX := g++

CXXFLAGS := 

INCS := include

SRC := src
OBJ := obj
LIB := lib

SRCS := $(wildcard $(SRC)/*.cpp)
OBJS := $(SRCS:$(SRC)/%.cpp=$(OBJ)/%.o)
LIBS := $(wildcard $(LIB)/*.c)
LIBS_O := $(LIBS:$(LIB)/%.c=$(LIB)/%.o)

TARGET := main

.PHONY: all clean run full_clean

all: $(TARGET) 

$(TARGET): $(LIBS_O) $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@ -I $(INCS) -lglfw3 -lgdi32 -lopengl32

$(OBJ)/%.o: $(SRC)/%.cpp | $(OBJ)
	$(CXX) $(CXXFLAGS) -c $< -o $@ -I $(INCS)

$(LIB)/%.o: $(LIB)/%.c
	$(CXX) $(CXXFLAGS) -c $< -o $@ -I $(INCS)

$(OBJ):
	mkdir -p $(OBJ)

clean:
	$(RM) -rv $(TARGET) $(OBJ)/*.o

full_clean:
	$(RM) -rv $(TARGET) $(OBJ)/*.o $(LIB)/*.o


