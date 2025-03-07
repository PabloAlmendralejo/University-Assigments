# Root-Finding Methods in Fortran

This Fortran program implements various root-finding methods, including the **Bisection Method**, **False Position Method**, and **Newton-Raphson Method** for solving nonlinear equations. The program allows the user to find the roots of a user-defined function within a specified interval and with a given precision. The roots are calculated using one of the aforementioned methods, and the program outputs the root and the number of iterations taken for convergence.

## Program Structure

- **Main Program**:
  - `root_finder`: The main driver of the program that allows the user to select the root-finding method (Bisection, False Position, or Newton-Raphson), input the required values (interval, precision, and maximum iterations), and outputs the calculated root.

- **Module**:
  - `root_finding_methods`: Contains the root-finding methods (Bisection, False Position, and Newton-Raphson). This module also provides an abstraction for the methods so they can be extended in the future.

- **Functions**:
  - `my_function`: An example user-defined function (`x^3 - 6x^2 + 11x - 6`) for which the roots are being calculated.
  - `df`: The derivative of `my_function`, used by the Newton-Raphson method for root calculation.

## Input
- **Method Selection**: Choose the root-finding method (1: Bisection, 2: False Position, 3: Newton-Raphson).
- **Interval**: Input the interval endpoints `[a1, a2]` for the root-finding.
- **Precision**: Desired precision for the root.
- **Maximum Iterations**: Maximum number of iterations to perform for the root-finding process.

## Output
- The root of the function found by the selected method.
- The number of iterations taken to find the root (if convergence is achieved).

## Compilation

1. Save the code to `root_finding_program.f90`.
2. Compile using `gfortran`:
   ```bash
   gfortran root_finding_program.f90 -o root_finding_program
   ```
3. Run the compiled program:
   ```bash
   ./root_finding_program
   ```

## Example
**Input**:
```
Enter the method choice (1: Bisection, 2: False Position, 3: Newton-Raphson)
1
Enter the interval [a1, a2], precision, and maximum iterations
1.0 3.0 0.0001 100
```

**Output**:
```
Using Bisection Method
Root: 2.000000123
```

## Notes
* The program iteratively narrows down the interval or performs method-specific calculations until the root is found or the specified precision is met.
* If no root exists or the method exceeds the iteration count, an error message is displayed.
* The Newton-Raphson method also requires the derivative of the function, which is provided in the example (`df`).

## License
Free to modify and distribute under the terms of your choice.

## Contact
For questions or suggestions, feel free to reach out.
