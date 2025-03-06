# Hospital Organization Program

## Description
This program is designed to help organize the hospital in Badajoz by managing and tracking the patients in various hospital floors (or "plantas"). It keeps records of the number of patients in each floor, identifies the oldest patient in each floor, and calculates the average time a patient has spent in the hospital for each floor.

The system uses text files to store and load patient data and provides an interactive menu for the user to manage and retrieve information about patients across different floors.

## Features
- **Number of patients per floor**: Display the number of patients present on each floor.
- **Oldest patient on a floor**: Retrieve the patient with the longest stay (oldest entry) on a specific floor.
- **Average stay time per floor**: Calculate and display the average length of stay for patients on a floor.
- **Exit**: Exit the program.

## Data Structure
### Planta Class
The `Planta` class is used to store patient data for each floor:
- `dia[C_Pacientes]`: A list storing the number of days each patient has been in the hospital.
- `numero[C_Pacientes]`: A list storing the patient numbers (IDs).
- `total`: An integer that tracks the total number of patients on the floor.

### Constants
- `C_Plantas`: The number of floors in the hospital (7 floors).
- `C_Pacientes`: The maximum number of patients on each floor (20 patients).
- `P_max`: Maximum number of floors in the hospital.
- `P_min`: Minimum number of floors in the hospital.

## Functions

### `pacientes_por_planta(n: list)`
Prints the number of patients on each floor.

### `paciente_mas_antiguo_en_planta(n: list, planta: int) -> int`
Returns the patient number of the oldest patient (the one with the longest stay) on a specific floor.

### `tiempo_promedio_planta(n: list)`
Calculates and prints the average length of stay for patients on each floor.

### `open("pacientes.txt", "tr", encoding="utf-8")`
This function attempts to open the `pacientes.txt` file to load the patient data. The file is expected to have the following format:
- **Format**: `FloorNumber;TotalPatients;Patient1Days Patient1Number;Patient2Days Patient2Number;...`

## User Input Flow
The program displays a menu and prompts the user to choose an option:
1. **Number of patients per floor**: Displays how many patients are on each floor.
2. **Oldest patient on a floor**: Asks for a floor number and displays the oldest patient (with the longest stay) on that floor.
3. **Average stay time per floor**: Calculates and prints the average time patients have stayed on each floor.
4. **Exit**: Exits the program.

## Example Usage

1. **Menu**:
Menú del programa:

Número de pacientes por planta  
Paciente Mas antiguo en una planta  
Tiempo promedio de ingreso por planta  
Salir  
Elíja una opción:

2. **Option 1** - Number of Patients on Each Floor:  
Planta 1: 15 pacientes  
Planta 2: 12 pacientes  
Planta 3: 20 pacientes ...

3. **Option 2** - Oldest Patient on a Floor:  
Ingrese el número de la planta: 1  
El paciente mas antiguo de la planta 1 es el 1005

4. **Option 3** - Average Stay Time Per Floor:  
Planta 1: 12.5 días  
Planta 2: 9.8 días  
Planta 3: 14.0 días ...
