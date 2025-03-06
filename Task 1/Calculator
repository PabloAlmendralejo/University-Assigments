''
Program: This programs simulates the use case of a calculator

Variables
'''

'''
Variables
operando1,operando2,operador,resultado:float
operandostr:str
'''
operandostr=0

while(operandostr!="q"):
    operandostr=input()

    if (operandostr=="q"):
        break

    while True:
        operador=input()
        if (operador=="+" or operador=="-" or operador=="/" or operador=="//" or operador=="*" or operador=="**" or operador=="%"):
            break
        else:
            print("Operador no válido")

    operando1=float(operandostr)

    if (operador=="/" or operador=="//" or operador=="%"):   
        while True:
            operando2=float(input())
            if (operando2 == 0):
                print("División por cero, introduzca otro valor")
            else:
                break
    else:
        operando2=float(input())      

    if (operador=="+"):
        resultado=operando1+operando2
    elif (operador=="-"):
        resultado=operando1-operando2
    elif (operador=="*"):
        resultado=operando1*operando2
    elif (operador=="/"):
        resultado=operando1/operando2
    elif (operador=="//"):
        resultado=operando1//operando2
    elif (operador=="**"):
        resultado=operando1**operando2
    elif (operador=="%"):
        resultado=operando1%operando2

    print("= ",format(resultado,".2f"))
    

