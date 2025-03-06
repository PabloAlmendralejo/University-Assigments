# Temperature Recording Program

## Description
This program records the maximum and minimum temperatures for each day of the year. It allows users to:
1. Register temperatures for specific days.
2. Query the minimum, maximum, and average temperatures within a specified date range.
3. Exit the program.

It stores temperature records for each day of the year (31 days per month, 12 months). The program can compute:
- The minimum temperature within a given date range.
- The maximum temperature within a given date range.
- The average temperature over a date range.

## Features
- **Register Temperature**: Record the maximum and minimum temperature for a specific day and month.
- **Minimum Temperature in Interval**: Retrieve the lowest temperature recorded in a given date range.
- **Maximum Temperature in Interval**: Retrieve the highest temperature recorded in a given date range.
- **Average Temperature in Interval**: Calculate the average temperature for a specific date range.
- **Exit**: Exit the program.

## Data Types
### Dia Class
The `Dia` class defines the data structure for storing temperature data for a single day:
- `dia`: Day of the month (integer).
- `mes`: Month of the year (integer).
- `min`: Minimum temperature for the day (float).
- `max`: Maximum temperature for the day (float).

## Functions

### `registra_temp(dia, mes, max, min, v, tam)`
Registers the temperature (both maximum and minimum) for a given day and month in the list `v`. 

### `min_temp_dia(num_mes, num_dia, v)`
Returns the minimum temperature for a given day and month.

### `max_temp_dia(num_mes, num_dia, v)`
Returns the maximum temperature for a given day and month.

### `media_temp_intervalo(num_mes1, num_dia1, num_mes2, num_dia2, v, tam)`
Calculates the average temperature within the given date range (`num_mes1` to `num_mes2` and `num_dia1` to `num_dia2`).

### `min_temp_intervalo(num_mes1, num_dia1, num_mes2, num_dia2, v)`
Finds the minimum temperature within the given date range (`num_mes1` to `num_mes2` and `num_dia1` to `num_dia2`).

### `max_temp_intervalo(num_mes1, num_dia1, num_mes2, num_dia2, v)`
Finds the maximum temperature within the given date range (`num_mes1` to `num_mes2` and `num_dia1` to `num_dia2`).

### `check_intervalo(num_mes1, num_dia1, num_mes2, num_dia2)`
Checks if the start date is earlier than the end date. Returns `True` if valid, `False` otherwise.

## Variables
- `Dias`: Total number of days in a year (31 days per month × 12 months).
- `v`, `aemet`, `aux`: Arrays of `Dia` objects to store temperature data.
- `cont`: Counter for the number of registered temperatures.
- `tam`: Size of the array of temperature records.
- `min`, `max`: Minimum and maximum temperatures.
- `m1`, `d1`, `m2`, `d2`: Month and day for date ranges.
- `media`, `res`, `resu`, `resur`: Intermediate variables for storing results.

## User Input Flow
1. The program presents the user with a menu of options:
   - Option 1: Register a temperature.
   - Option 2: Find the minimum temperature in a specified date range.
   - Option 3: Find the maximum temperature in a specified date range.
   - Option 4: Find the average temperature in a specified date range.
   - Option 5: Exit the program.
   
2. For each option (except exit), the program will prompt the user for input:
   - For registering temperature, the user must enter the temperature values, the month, and the day.
   - For querying temperature statistics, the user is asked for a start date and an end date.

## Example Usage

1. **Register a temperature**:
   - Option: 1
   - Enter the minimum temperature, maximum temperature, month, and day.

2. **Find minimum temperature in a date range**:
   - Option: 2
   - Enter the start date and end date (month and day).

3. **Find maximum temperature in a date range**:
   - Option: 3
   - Enter the start date and end date (month and day).

4. **Find average temperature in a date range**:
   - Option: 4
   - Enter the start date and end date (month and day).

5. **Exit the program**:
   - Option: 5
