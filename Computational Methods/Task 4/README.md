# Gaussian Elimination Solver in Fortran

This Fortran program implements the **Gaussian Elimination** method to solve a system of linear equations. The program takes a square matrix `A` and a vector `b` as input, representing the system `Ax = b`, and computes the solution vector `x` using Gaussian elimination with partial pivoting.

## Program Structure

- **Main Program**:
  - `ejer3`: The main driver of the program that reads the matrix `A` and vector `b` from the user, calls the Gaussian elimination function, and outputs the solution vector `x`.

- **Function**:
  - `gauss`: Implements the Gaussian elimination algorithm with partial pivoting to solve the system of linear equations.

## Input
- **Matrix Dimension (`n`)**: The size of the square matrix `A` (number of rows/columns).
- **Matrix Coefficients**: The coefficients of the matrix `A`, entered row by row.
- **Vector Dimension (`m`)**: The size of the vector `b` (must match the matrix dimension `n`).
- **Vector Values**: The values of the vector `b`.

## Output
- **Solution Vector (`x`)**: The solution to the system of linear equations `Ax = b`.
- **Transformed Matrix (`A`)**: The upper triangular matrix obtained after Gaussian elimination.

## How to Use

1. Compile the program using `gfortran`:
   ```bash
   gfortran gaussian_elimination.f90 -o gaussian_elimination
   ```
2. Run the compiled program:
   ```bash
   ./gaussian_elimination
   ```
3. Follow the prompts to input the matrix and vector values.

## Example Input
Input:
```
Enter the dimension of the matrix
3

Enter the matrix coefficients row by row
2 -1 3
4 2 -1
1 3 2

Enter the dimension of the vector
3

Enter the values of the vector
5
6
8
```

Output:
```
Solution Vector:
1.000000
2.000000
3.000000

Transformed Matrix:
4.000000  2.000000  -1.000000
0.000000  2.500000  2.250000
0.000000  0.000000  3.800000
```

## Code Overview
### Gaussian Elimination Function (`gauss`)
* Performs partial pivoting to ensure numerical stability.
* Transforms the matrix `A` into an upper triangular form.
* Solves for the vector `x` using back substitution.

### Main Program (`ejer3`)
* Reads user input for the matrix `A` and vector `b`.
* Calls the `gauss` function to solve the system.
* Outputs the solution vector and the transformed matrix.
