# Base directory for all problems (change it to your codeforces folder)
BASE_DIR=~/Documents/dev/codeforces

# Prompt for section (A, B, C...)
read -p "Which problem set? (A, B, C...): " PROB_SET
PROB_SET="${PROB_SET^^}"  # force uppercase
DIR_NAME="${PROB_SET}-Problems" # Here you can rename the problem folders

# Create the A/B/... Problems folder if it doesn't exist
mkdir -p "$BASE_DIR/$DIR_NAME"

# Ask for problem name
read -p "Enter problem name (e.g. 1846A): " PROB_NAME
TARGET_DIR="$BASE_DIR/$DIR_NAME/$PROB_NAME"

# Create the problem directory
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# main.cpp template
cat << EOF > main.cpp
#include <iostream>
#include <vector>
#include <string>
#include <set>
#include <algorithm>
#include <sstream>
#include <cmath>
#include <map>

int main()
{
    
    
    return 0;
}
EOF

# Makefile template
cat << 'EOF' > Makefile
CC = g++
CFLAGS = -Wall -Wextra -g 

all: main run clean

main: main.cpp
	$(CC) $(CFLAGS) main.cpp -o main

run: main
	./main

clean:
	rm -f main
EOF

code -n .

echo "Created $PROB_NAME inside $DIR_NAME with Makefile and main.cpp"
