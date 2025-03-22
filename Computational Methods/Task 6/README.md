# README
## Fortran Interpolation Program

### Overview
This program performs interpolation using two different methods implemented in Fortran. It reads input data points from files and calculates interpolated values for given points. The program consists of a main program and two functions:
* `new(x, y, p)`: Computes interpolated values using a polynomial interpolation method.
* `dif(x, y, p)`: Computes interpolated values using a finite difference method.

### Files Required
Ensure the following input files are available before running the program:
* `nodos.txt`: Contains the `x` values (nodes) for interpolation.
* `nodos_imagenes.txt`: Contains the corresponding `y` values (function values at nodes).
* `puntos.txt`: Contains the `p` values (points at which interpolation is needed).

### Compilation and Execution
To compile the Fortran program, use the following command:
```bash
gfortran interpolation.f90 -o interpolation
```

To run the program:
```bash
./interpolation
```

### Input and Output
The program will prompt the user to enter the dimensions of `x`, `y`, and `p`. It will then read the data from the corresponding files and compute the interpolated values, which will be displayed as output.

### Example Usage
Input:
```
Enter dimension for x and y arrays: 5
Enter dimension for p array: 3
```

Output:
```
Interpolated values using polynomial method:
f(1.5) = 3.375
f(2.7) = 8.019
f(4.2) = 17.64

Interpolated values using finite difference method:
f(1.5) = 3.375
f(2.7) = 8.019
f(4.2) = 17.64
```
