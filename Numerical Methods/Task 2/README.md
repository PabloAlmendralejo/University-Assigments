# Root-Finding Methods in Fortran

This Fortran program implements the **Bisection Method** and **False Position Method** for root-finding of two user-defined functions within specified intervals. The program calculates and outputs the roots and iteration counts for both methods.

## Program Structure

- **Main Programs**:
  - `principal`: Uses the Bisection Method.
  - `principal2`: Uses both the Bisection and False Position Methods.
  
- **Subroutines**:
  - `biseccion`: Implements the Bisection Method.
  - `fp`: Implements the False Position Method.

## Input
- Intervals `[a1, a2]` and `[b1, b2]` for both functions.
- Precision (`c1`, `c2`) and iteration count parameters.

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

## Example Input
Input for Function 1:
```
deme la acotacion, la precision y las iteraciones para la funcion 1
```

Input for Function 2:
```
deme la acotacion, la precision y las iteraciones para la funcion 2
```

## Notes
* The program iteratively narrows down the interval using the methods until the root is found or the specified precision is met.
* If no root exists or the method exceeds the iteration count, an error message is displayed.
