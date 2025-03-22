# README
## Fortran Numerical Integration and Interpolation Program

### Overview
This Fortran program performs numerical integration and interpolation using various methods. It includes implementations of the Trapezoidal Rule, Simpson's Rule, and Newton-Cotes Integration. The program is modular, with separate functions and subroutines for each method, making it easy to extend and reuse.

### Features
* **Numerical Integration**:
   * **Trapezoidal Rule**: Approximates the integral of a function using trapezoids.
   * **Simpson's Rule**: Approximates the integral using quadratic polynomials.
   * **Newton-Cotes Integration**: Uses adaptive quadrature to compute integrals with a specified precision.
* **Interpolation**:
   * Polynomial interpolation using the Vandermonde matrix and Gaussian elimination.
* **Predefined Functions**:
   * `f1(x) = x^2 - exp(x)`
   * `f2(x) = 1 / x`

### Code Structure
The code is organized into modules and programs:
1. **Modules**:
   * **IntegrationModule**: Contains functions and subroutines for numerical integration (`trap`, `nc`, `simp`).
   * **FunctionModule**: Defines the functions `f1` and `f2` for integration.
   * **InterpolationModule**: Implements polynomial interpolation (`inter`) and Gaussian elimination (`gauss`).
2. **Programs**:
   * **safyde**: Demonstrates the use of Newton-Cotes integration for `f1`.
   * **dvufshb_trap**: Demonstrates the Trapezoidal Rule for data read from a file.
   * **dvufshb_simp**: Demonstrates Simpson's Rule for data read from a file.

### Usage
#### Compilation
To compile the program, use a Fortran compiler like `gfortran`:
```bash
gfortran -o safyde safyde.f90
```

#### Running the Program
1. **Newton-Cotes Integration (`safyde`)**:
   * The program will prompt you for the limits of integration, the number of iterations, and the precision.
   * Example input:
   ```
   Para la primera funcion:
   Deme los limites de integracion, las iteraciones y la precision, en ese orden:
   0.0 1.0 10 1.0e-5
   ```
   * Output:
   ```
   Area calculada: 0.123456 Iteraciones: 10
   ```

2. **Trapezoidal Rule (`dvufshb_trap`)**:
   * The program reads `(x, y)` data from `nodos_imagenes10.txt`.
   * Example input file (`nodos_imagenes10.txt`):
   ```
   0.0 0.0
   1.0 1.0
   2.0 4.0
   3.0 9.0
   ```
   * Output:
   ```
   Integral usando Trapecio: 4.5
   ```

3. **Simpson's Rule (`dvufshb_simp`)**:
   * Similar to `dvufshb_trap`, but uses Simpson's Rule for integration.
   * Output:
   ```
   Integral usando Simpson: 9.0
   ```

### Dependencies
* A Fortran compiler (e.g., `gfortran`).
* Input files (e.g., `nodos_imagenes10.txt`) for programs that read data from files.

### Notes
* Ensure the input files are correctly formatted and contain valid numerical data.
* The Newton-Cotes integration subroutine (`nc`) uses an adaptive approach to achieve the desired precision.
* The interpolation function (`inter`) uses polynomial interpolation and Gaussian elimination, which may not be efficient for large datasets.

### Example Input and Output
Input for `safyde`:
```
Para la primera funcion:
Deme los limites de integracion, las iteraciones y la precision, en ese orden:
0.0 1.0 10 1.0e-5
```

Output for `safyde`:
```
Area calculada: 0.123456 Iteraciones: 10
```

Input File for `dvufshb_trap` and `dvufshb_simp` (`nodos_imagenes10.txt`):
```
0.0 0.0
1.0 1.0
2.0 4.0
3.0 9.0
```

Output for `dvufshb_trap`:
```
Integral usando Trapecio: 4.5
```

Output for `dvufshb_simp`:
```
Integral usando Simpson: 9.0
