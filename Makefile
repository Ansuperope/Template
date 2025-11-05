CC = g++
CFLAGS = -Wall -g -std=c++11

TARGET = main
HEADERS = $(wildcard *.h)	# All header files in the directory
OBJS = $(SRCS:.cpp=.o)		# Convert source files to object files

all: $(TARGET)

run:
	make clean
	make all
	./$(TARGET)

# Link object files into executable
$(TARGET): $(TARGET).cpp
	$(CC) $(CFLAGS) $@.cpp -o $@
# $@ target name
# $^ all prerequisites / dependencies

# Compile .cpp files to .o files
%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@
# % pattern matching
# . target files
# $< first prerequisite

clean:
	rm -f $(OBJS) $(TARGET)

save:
	git add .

push:
	git push --set-upstream origin main
