# Fortran Program: Array and Matrix Operations

This Fortran program performs a series of array and matrix operations based on user input. The program includes options to compute maximum/minimum values, sums, and products, and to reshape arrays into matrices. It also includes various intrinsic and custom methods to manipulate vectors and matrices.

## Menu Options
1. **Vectors: Max, Min, Sum, Product Calculation**
2. **Matrix: Reshape, Column/Row Operations**
3. **Reallocation and New Operations on Vectors**
4. **Exit**

The user can select an option by entering the corresponding number, and the program will execute the related task. If the user does not choose option 4 (Exit), the menu will be displayed again. The program will continue running until the user selects the exit option.

## Description of the Options

### Option 1: Vectors - Max, Min, Sum, Product Calculation
The program will:
- Read the dimensions and elements of two vectors A and B.
- Combine the vectors into a new vector C.
- Calculate the maximum and minimum values of vector C using both intrinsic methods (`maxval`, `minval`) and custom methods.
- Calculate the sum and product of every other element in C using both intrinsic and custom loop-based methods.

### Option 2: Matrix - Reshape, Column/Row Operations
The program will:
- Reshape vector A into a 5x3 matrix.
- Calculate the sum of the second column and the product of the fourth row.
- Double the values of the reshaped matrix.
- Perform subsetting to extract a portion of the matrix.

### Option 3: Reallocation and New Operations on Vectors
The program will:
- Reallocate vectors A and B with predefined values.
- Create a new vector C by taking the square roots of the corresponding elements in A and B.
- Demonstrate the reshaping of a 2D matrix into a 1D vector.

### Option 4: Exit
The program will end its execution when the user selects this option.

## Requirements
- The program handles dynamic memory allocation for vectors and matrices.
- Matrix dimensions must be between 1 and 6 for rows and columns.
- The program outputs results in the specified format, including max/min values, sums, products, and reshaped matrices.

## Example Outputs
1. **Vectors - Max, Min, Sum, Product Calculation:**
    ```
    The max value is 13, the min value is -6
    Sum of every other element: 10, Product: 20
    ```

2. **Matrix - Reshape, Column/Row Operations:**
    ```
    The sum of column 2 is 24, the product of row 4 is 30
    Reshaped matrix:
    [1, 2, 3]
    [4, 5, 6]
    [7, 8, 9]
    ```

3. **Reallocation and New Operations on Vectors:**
    ```
    New vector C (sqrt values):
    [1.0, 2.0, 3.0]
    ```

## Conclusion
This Fortran program demonstrates basic array and matrix operations, including input handling, reshaping, and performing calculations using both intrinsic and custom methods.
