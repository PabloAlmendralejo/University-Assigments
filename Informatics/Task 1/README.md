# Python Number Operations Program

## Description

This Python program allows users to perform mathematical operations (sum or average) on specific types of numbers (even, odd, or prime) within a given range. The user inputs two integers (n1 and n2), ensuring that n1 < n2, and selects the desired operation and number type.

## Features

- Reads two integers (n1 and n2) from the user, ensuring n1 < n2.
- Allows selection of a mathematical operation:
  - 1: Sum of the selected numbers
  - 2: Average of the selected numbers
- Allows selection of the type of numbers to operate on:
  - 1: Even numbers
  - 2: Odd numbers
  - 3: Prime numbers
- Computes and displays the result in the following formats:
  - La suma es XX (for sum results)
  - La media es XX.XX (for average results, rounded to two decimal places)
- Asks the user if they want to repeat the process, accepting only S, s, N, or n as valid inputs.

## How It Works

1. The program prompts the user to enter two integers (n1 and n2), ensuring n1 < n2.
2. The user chooses a mathematical operation:
   - 1 for sum
   - 2 for average
3. The user selects which type of numbers to operate on:
   - 1 for even numbers
   - 2 for odd numbers
   - 3 for prime numbers
4. The program calculates and displays the result in the specified format.
5. The user is asked if they want to run the program again:
   - Entering S or s restarts the process.
   - Entering N or n exits the program.

## Example Output

Enter the first integer (n1): 5  
Enter the second integer (n2): 15  

Choose an operation:  
1 - Sum  
2 - Average  

Selection: 1  

Choose the type of numbers:  
1 - Even  
2 - Odd  
3 - Prime  

Selection: 2  

La suma es 50  

Do you want to run the program again? (S/N): N
