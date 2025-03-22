# LU Decomposition and System Solver in Fortran

This Fortran program implements **LU Decomposition** using Gaussian elimination with partial pivoting to solve a system of linear equations. The program decomposes a square matrix `A` into a lower triangular matrix `L` and an upper triangular matrix `U`, and then solves the system `Ax = b` using forward and backward substitution.

## Program Structure

- **Main Program**:
  - `practfds`: The main driver of the program that reads the matrix `A` and vector `b` from the user, performs LU decomposition, and solves the system `Ax = b`.

- **Subroutines**:
  - `gaussnueva`: Implements Gaussian elimination with partial pivoting to decompose the matrix `A` into `L` and `U`.
  - `funcdoolite`: Solves the system `Ax = b` using forward and backward substitution after LU decomposition.

## Input
- **Matrix Dimension (`n`)**: The size of the square matrix `A` (number of rows/columns).
- **Matrix Coefficients**: The coefficients of the matrix `A`, entered row by row.
- **Vector Values**: The values of the vector `b` (independent terms).

## Output
- **L Matrix**: The lower triangular matrix obtained from LU decomposition.
- **U Matrix**: The upper triangular matrix obtained from LU decomposition.
- **Pivot Vector**: The permutation vector resulting from partial pivoting.
- **Solution Vector (`x`)**: The solution to the system of linear equations `Ax = b`.

## How to Use

1. Compile the program using `gfortran`:
   ```bash
   gfortran lu_decomposition.f90 -o lu_decomposition
   ```
2. Run the compiled program:
   ```bash
   ./lu_decomposition
   ```
3. Follow the prompts to input the matrix and vector values.

## Example Input
Input:
```
Deme la dimension de la matriz
3

Dime los indices de la matriz
2 -1 3
4 2 -1
1 3 2

Dime los indices del vector
5
6
8
```

Output:
```
Las matrices pedidas son:
4.000000  2.000000  -1.000000
0.000000  2.500000  2.250000
0.000000  0.000000  3.800000

1.000000  0.000000  0.000000
0.250000  1.000000  0.000000
0.500000  0.200000  1.000000

El vector de pivoteamiento es: 2 3 1

La solución es:
1.000000
2.000000
3.000000
```

## Code Overview
### Subroutine `gaussnueva`
* Performs Gaussian elimination with partial pivoting to decompose the matrix `A` into `L` and `U`.
* Updates the pivot vector to track row swaps.
* Ensures numerical stability by selecting the largest pivot element.

### Function `funcdoolite`
* Solves the system `Ax = b` using forward substitution for `L * y = b` and backward substitution for `U * x = y`.
* Uses the pivot vector to reorder the vector `b` before solving.

### Main Program `practfds`
* Reads user input for the matrix `A` and vector `b`.
* Calls `gaussnueva` to perform LU decomposition.
* Calls `funcdoolite` to solve the system.
* Outputs the `L` and `U` matrices, pivot vector, and solution vector.
