# Python Program: Menu of Options

This Python program presents a menu with several options to perform various mathematical tasks, string operations, and matrix computations. The menu will be displayed to the user until they choose the **Exit** option (option 4). Below is a description of the available options and how they work.

## Menu Options

1. **Vectors: Mode Calculation**
2. **Strings: Average Occurrence of Vowels**
3. **Matrices: Values Less Than the Mean**
4. **Exit**

The user can select an option by entering the corresponding number, and the program will execute the related task. If the user does not choose option 4 (Exit), the menu will be displayed again. The program will continue running until the user selects the exit option.

---

## Description of the Options

### Option 1: Vectors - Mode Calculation

- The program will read integer numbers from the user consecutively until they enter a **0** (the 0 is not included in the calculation).
- The program can read up to **50 numbers** (excluding the 0).
- After reading the numbers, the program will display the number that repeats the most along with its frequency.
  
  **Example:**
  
  For the input: `[-4, 2, -6, 1, 13, 5, -3, 2, 2, 1]`, the output will be:
The most repeated number is 2 and its frequency is 3

vbnet
Copiar
Editar

If there are multiple numbers with the same frequency, the program will display the first one encountered.

### Option 2: Strings - Average Occurrence of Vowels

- The program will read a string of text with **up to 15 words**.
- Then, it will ask for a vowel (a, e, i, o, u) and calculate:
- **The average occurrence of that vowel** as a percentage of the total vowels in the string.
- **The average occurrence of all vowels** as a percentage of the total characters (excluding spaces).

**Example:**

For the string `"la mejor estrategia es la perseverancia"` and the vowel `"e"`, the output will be:
The vowel e appears on average 43.8 % and the average occurrence of all vowels is 47.1 %

markdown
Copiar
Editar

### Option 3: Matrices - Values Less Than the Mean

- The program will read a matrix of **dimensions m x n**, where:
- **1 < m < 7** (rows)
- **1 < n < 7** (columns)
- The program will ask the user to provide the values for the matrix (all positive integers).
- It will then calculate the **arithmetic mean** of all the matrix values and display:
- The total number of values that are less than the mean, along with those values.

**Example:**

For a matrix:
3 4 5 2 6 7 1 9 8

lua
Copiar
Editar

The output will be:
The total number of values less than the mean is 4: 3 1 4 2

yaml
Copiar
Editar

### Option 4: Exit

- The program ends its execution when the user selects this option.

---

## Requirements

- The program must handle user input appropriately.
- Results should be displayed in the specified format for each option.
- The program must handle matrix dimension restrictions and the word count limit for the string input
