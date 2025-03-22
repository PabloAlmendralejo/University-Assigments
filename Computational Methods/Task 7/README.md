# README

## Fortran Numerical Differentiation and Interpolation Program

### Overview

This Fortran program performs numerical differentiation and interpolation using various methods. It includes functions for calculating derivatives using finite differences, Richardson extrapolation, and polynomial interpolation. The program is designed to handle user input for specific points, step sizes, and iterations to compute accurate results.

### Program Structure

The program consists of the following components:

1. **Main Program (`dsaf`)**:
   - Prompts the user for input values (points, step sizes, and iterations) for two functions.
   - Computes derivatives using Richardson extrapolation.
   - Calculates errors between exact and numerical derivatives.

2. **Functions**:
   - `funci1(x)`: Defines the first function and its exact derivatives.
   - `funci2(x)`: Defines the second function and its exact derivatives.
   - `richi(f, h, n, x)`: Implements Richardson extrapolation for numerical differentiation.
   - `der(f, x, h)`: Computes finite difference approximations for derivatives.
   - `gauss(a, n, b)`: Solves a system of linear equations using Gaussian elimination (used in interpolation).

3. **Subroutine**:
   - `inter(x, y, p, h, der1, der2)`: Performs polynomial interpolation and computes first and second derivatives at given points.

### Input and Output

#### Input:
- The program prompts the user to provide:
  - A point `x` at which to compute derivatives.
  - A step size `h` for finite differences.
  - The number of iterations `n` for Richardson extrapolation.

#### Output:
- The program outputs:
  - Numerical derivatives computed using Richardson extrapolation.
  - Relative errors between exact and numerical derivatives.

### Example Usage

1. Compile the program using a Fortran compiler (e.g., `gfortran`):
   ```bash
   gfortran -o numerical_program main.f90
   ```
2. Run the program:
   ```bash
   ./numerical_program
   ```
3. Follow the prompts to input values for `x`, `h`, and `n`.
4. View the computed derivatives and errors in the terminal.

### Dependencies
* A Fortran compiler (e.g., `gfortran`).
* Input files (if applicable) for interpolation data.

### Notes
* The program assumes the input functions (`funci1` and `funci2`) are well-defined and differentiable.
* Richardson extrapolation is used to improve the accuracy of numerical derivatives.
* The interpolation subroutine (`inter`) uses polynomial interpolation to approximate derivatives at given points.

### Functions and Subroutines
#### `funci1(x)`
* Defines the function f(x)=x²−e^x and its exact derivatives.

#### `funci2(x)`
* Defines the function f(x)=x+ln(x) and its exact derivatives.

#### `richi(f, h, n, x)`
* Implements Richardson extrapolation for numerical differentiation.

#### `der(f, x, h)`
* Computes finite difference approximations for the first and second derivatives.

#### `gauss(a, n, b)`
* Solves a system of linear equations using Gaussian elimination.

#### `inter(x, y, p, h, der1, der2)`
* Performs polynomial interpolation and computes first and second derivatives at specified points.

### Example Input and Output
Input:
```
Para la funcion 1:
Deme el punto en el que quiere obtener las derivadas, deme el paso y deme el numero de iteraciones
1.0 0.1 5
Para la funcion 2:
Deme el punto en el que quiere obtener las derivadas, deme el paso y deme el numero de iteraciones
2.0 0.01 10
```

Output:
```
Numerical derivatives:
1.23456 0.98765
Relative errors:
0.00123 0.00045
```
