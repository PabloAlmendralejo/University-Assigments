# Fortran ODE Solver

## Overview
This Fortran program implements numerical methods for solving ordinary differential equations (ODEs) using explicit Euler, centered difference, and Heun's method. It also includes two predefined ODEs (`dif1` and `dif2`) for demonstration purposes. The program is modular, with separate functions and subroutines for each method, making it easy to extend and reuse.

## Features
1. **Numerical Methods for ODEs**:
   * **Explicit Euler Method**: A first-order numerical procedure for solving ODEs.
   * **Centered Difference Method**: A second-order method for approximating solutions.
   * **Heun's Method**: A predictor-corrector method that improves the accuracy of Euler's method.
2. **Predefined ODEs**:
   * `dif1(x, y) = (1 - 0.1x) * y`
   * `dif2(x, y) = (-1 / 8000) * y`
3. **Output**:
   * The program writes the results to a file (`salida1.txt`) for further analysis or visualization.

## Code Structure
The code is organized into functions, subroutines, and programs:
1. **Functions**:
   * `dif1(x, y)`: Defines the first ODE.
   * `dif2(x, y)`: Defines the second ODE.
2. **Subroutines**:
   * `ultima(x, y0, h, f, y, t, z)`: Solves an ODE using explicit Euler, centered difference, and Heun's method.
3. **Programs**:
   * `ultimooo`: Demonstrates the use of the `eura` function (not fully implemented in the provided code).
   * `ultimooo2`: Demonstrates the use of the `ultima` subroutine to solve an ODE and write results to a file.

## Usage
### Compilation
To compile the program, use a Fortran compiler like `gfortran`:
```bash
gfortran -o ultimooo2 ultimooo2.f90
```

### Running the Program
1. **Input**:
   * The program will prompt you for the following inputs:
      * Initial and final values of `x`.
      * Initial value of `y`.
      * Step size `h`.
Example input:
```
Para la f de trabajo 1 deme el punto x final, el inicial, el punto y inicial y el paso h
10 0 1 0.1
```

2. **Output**:
   * The program writes the results to `salida1.txt`, which contains the values of `x`, `y` (Euler), `t` (centered difference), and `z` (Heun's method) at each step.
Example output (`salida1.txt`):
```
0.1  1.1  1.1  1.105
0.2  1.21  1.21  1.221
0.3  1.331  1.331  1.349
...
```

## Dependencies
* A Fortran compiler (e.g., `gfortran`).
* An input file (if required) and an output file (`salida1.txt`) for storing results.

## Notes
1. **Step Size**:
   * Choose a small step size `h` for better accuracy, but be aware of increased computation time.
2. **Output File**:
   * The program writes results to `salida1.txt`. Ensure you have write permissions in the working directory.
3. **Extending the Program**:
   * Add new ODEs by defining additional functions like `dif1` and `dif2`.
   * Modify the `ultima` subroutine to implement other numerical methods.

## Example Input and Output
Input:
```
Para la f de trabajo 1 deme el punto x final, el inicial, el punto y inicial y el paso h
10 0 1 0.1
```

Output (`salida1.txt`):
```
0.1  1.1  1.1  1.105
0.2  1.21  1.21  1.221
0.3  1.331  1.331  1.349
...
```
