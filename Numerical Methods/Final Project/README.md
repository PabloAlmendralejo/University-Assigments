Copiar# Numerical Analysis of a 3D Autonomous System of Ordinary Differential Equations (ODEs)
## Overview
This project focuses on the numerical analysis of a 3D autonomous system of ordinary differential equations (ODEs). The system is defined by the vector field:

F(x,y,z)= [a(y−x−m_1 x− m_0−m_1/2(∣x+1∣−∣x−1∣)), x−y+z, −by]

The system is nonlinear due to the presence of absolute value terms. The project involves:

Equilibrium Points: Finding and analyzing the stability of equilibrium points.

Numerical Methods: Implementing and comparing numerical methods (Taylor, Runge-Kutta, Adams-Bashford, and Adams-Moulton) to approximate solutions.

Error Analysis: Calculating truncation errors and global errors for the numerical methods.

Linearization: Studying the linearized system around equilibrium points and random points.

## Code Structure
The code is organized into several sections, each addressing a specific aspect of the problem:

### 1. System Definition and Equilibrium Points
The system is defined using symbolic variables (x, y, z, a, b, m0, m1).

Equilibrium points are found by solving F(x,y,z)=0.

Stability analysis is performed by linearizing the system around equilibrium points and computing eigenvalues.

### 2. Numerical Methods
Taylor Series Method: A 2nd-order and 4th-order Taylor series method is implemented to approximate solutions.

Runge-Kutta Method: A 4th-order Runge-Kutta method is implemented for higher accuracy.

Adams-Bashford and Adams-Moulton: Predictor-corrector methods are implemented for efficient numerical integration.

### 3. Error Analysis
Truncation Error: The truncation error for the Taylor series method is calculated.

Global Error: The global error between Taylor series and Runge-Kutta methods is computed.

### 4. Linearization and Eigenvalue Analysis
The system is linearized around a user-defined point, and the Jacobian matrix is computed.

Eigenvalues and eigenvectors are calculated to study the behavior of the linearized system.

### 5. Visualization
Vector fields and numerical solutions are plotted in 3D to visualize the system's behavior.

## Key Functions and Methods
### 1. System Definition
F(x, y, z): Defines the vector field of the system.

solve([F(x, y, z)[0] == 0, F(x, y, z)[1] == 0, F(x, y, z)[2] == 0], x, y, z): Finds equilibrium points.

### 2. Numerical Methods
Taylor Series:

taylor(F, ini, t, n): Approximates solutions using the Taylor series method.

Runge-Kutta:

Runge_Kutta(F, ini, t, n): Approximates solutions using the 4th-order Runge-Kutta method.

Adams-Bashford:

Adams_Bashford(F, x0, x1, x2, t, a, n): Predicts solutions using the Adams-Bashford method.

Adams-Moulton:

Adams_Corrector(F, x0, x1, x2, t, a, n): Corrects solutions using the Adams-Moulton method.

### 3. Error Analysis
der_total_sistemas(F, n): Computes the nth derivative of the system for Taylor series expansion.

Taylor(T, a, b, ini, n): Computes the Taylor series approximation.

error_t: Computes the truncation error for the Taylor series method.

e_global: Computes the global error between Taylor and Runge-Kutta methods.

### 4. Linearization
jacobian(F, [x, y, z]): Computes the Jacobian matrix of the system.

evaluar_matriz_de_polinomios(matriz, valores): Evaluates the Jacobian matrix at a specific point.

estudio_estabilidad(A): Analyzes the stability of a point based on the eigenvalues of the Jacobian matrix.

### 5. Visualization
plot_vector_field3d(F(x, y, z), (x, xmin, xmax), (y, ymin, ymax), (z, zmin, zmax)): Plots the 3D vector field.

point(sol, color): Plots numerical solutions.

## Usage
### 1. Equilibrium Points
Define the system parameters (a, b, m0, m1).

Use solve to find equilibrium points.

Analyze stability using estudio_estabilidad.

### 2. Numerical Methods
Define initial conditions (ini = [x0, y0, z0]).

Choose a numerical method (Taylor, Runge-Kutta, Adams-Bashford, Adams-Moulton).

Specify the time range (t) and number of steps (n).

Compute solutions and compare results.

### 3. Error Analysis
Compute truncation errors for Taylor series methods.

Compare global errors between Taylor and Runge-Kutta methods.

### 4. Linearization
Choose a point for linearization.

Compute the Jacobian matrix and eigenvalues.

Analyze the stability of the linearized system.

### 5. Visualization
Plot vector fields and numerical solutions to visualize the system's behavior.

## Example
Input:
```python
ini = [2, 2, 2]  # Initial condition
t = 1            # Time range
n = 100          # Number of steps
```

Output:

```python
CopiarMétodo de Taylor con 100 pasos para t=1: [5.388804626893486, 2.7801087707195835, -3.2130548101272622]
Método de Runge-Kutta con 100 pasos para t=1: [5.365883939049152, 2.7635465814003455, -3.204674715297616]
```
