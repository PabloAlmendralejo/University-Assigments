# TV Program Management System

This Python program helps manage and organize information about TV programs. It provides functionalities for users to add new programs, view program schedules, find the longest program by genre, and calculate the average duration of programs by genre.

## Features

The program allows users to perform the following operations:

1. **Add a new program**: The user can enter program details such as the name, day, time, duration, and genre.
2. **List programs by day**: View all programs for a specific day of the week.
3. **List programs by time**: View all programs that air at a specific time.
4. **Longest program by genre**: Find the program with the longest duration for a given genre.
5. **Average duration by genre**: Calculate and display the average duration for programs within each genre.
6. **Exit**: Exit the program.

## Program Details

### Classes and Variables

- **Programa Class**: Stores details about a TV program including the program's name, day, time, duration, and genre.
- **Global Variables**: 
  - `program`: List of TV programs (up to 168 programs).
  - `cont`: Counter to keep track of the number of added programs.

### Operations

1. **Add New Program**: 
   - Prompts the user to input program details.
   - Valid genres include "cine", "deportes", "informativos", "series", and "otros".
   
2. **List Programs by Day**: 
   - Allows the user to input a day (e.g., "Monday") and displays all programs for that day, sorted by time.

3. **List Programs by Time**: 
   - Allows the user to input a time (e.g., "8:00") and displays all programs that air at that time, along with their genres.

4. **Longest Program by Genre**:
   - Prompts the user to input a genre (e.g., "deportes") and displays the longest program for that genre along with its details.

5. **Average Duration by Genre**:
   - Calculates the average duration of programs for each genre and displays the result.

6. **Exit**:
   - Ends the program.

## Example Usage

1. **New Program**  
2. **List Programs by Day**  
3. **List Programs by Time**  
4. **Longest Program by Genre**  
5. **Average Duration by Genre**  
6. **Exit**  

**Option: 1**  
Enter program name: "Football Highlights"  
Enter program day: "Monday"  
Enter program time: "18:00"  
Enter program duration: 30  
Enter program genre: "deportes"  

**Option: 2**  
Enter day: "Monday"  
List of programs for Monday:  
18:00 Football Highlights (deportes)  

**Option: 3**  
Enter time: "18:00"  
List of programs at 18:00:  
18:00 Football Highlights (deportes)  

**Option: 4**  
Enter genre: "deportes"  
Longest program for deportes:  
Monday 18:00 Football Highlights 30 minutos  

**Option: 5**  
Average duration by genre:  
deportes 30.00 minutos  

**Option: 6**  
Exiting program...
