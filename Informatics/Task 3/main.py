
'''
Tipos
    registro Programa
        nombre : str
        dia : str
        hora : str
        duracion : int
        genero : str

Variables

program : Programa
cont,n,u,v[num_pro],s,d,dur[num_pro],v1[num_pro],i,j,k : int
conta,suma,med : float
h,g,d,aux : str
'''

cont=0
class Programa:
    def __init__(self):
        self.nombre=" "
        self.dia=" "
        self.hora=" "
        self.duracion= [-1]
        self.genero=" "

num_pro=24*7
num_gen=5
program = [Programa() for i in range(num_pro)]
n=0

while(n!=6):

    print('1. Nuevo programa')
    print()

    print('2. Listado de programas de un día')
    print()

    print('3. Listado de programas a una hora')
    print()

    print('4. Programa de más duración para un género')
    print()

    print('5. Media de duración por género')
    print()

    print('6. Salir')
    print()

    n=int(input('Opción:'))
    if(n==1):
    
        program[cont].nombre=input('Nombre del programa: ')
        program[cont].dia=input('Día de emisión: ')
        program[cont].hora=input('Hora de emisión: ')
        program[cont].duracion=int(input('Duración: '))
        while True:
            program[cont].genero=input('Género: ')
            if (program[cont].genero=='cine' or program[cont].genero=='deportes' or program[cont].genero=='informativos' or program[cont].genero=='series' or program[cont].genero=='otros'):
                break

        cont+=1


        print()
    if(n==2):
        v1=[-1]*num_pro
        u=0
        aux=' '
        d=input('Día? ')
        print()
        for i in range(num_pro):
            for j in range(len(program[i].dia)):
                if (program[i].dia[j]==d):
                    v1[u]=program[i].hora
                    u+=1
        for i in range(u):
            for j in range(i,u):
                if(v1[i]>v1[j]):
                    aux=v1[i]
                    v1[i]=v1[j]
                    v1[j]=aux

        for i in range(u):
            for j in range(num_pro):
                for t in range(len(program[j].dia)):
                    if (v1[i]==program[j].hora and program[j].dia[t]==d):
                        print(v1[i], end=" ")
                        print(program[j].nombre, end=" ")
                        print('(',program[j].genero,')',sep='')
        print()
    if(n==3):
        s=0
        v=[-1]*num_pro
        h=input('Hora? ')
        print()
        for i in range(num_pro):
            if (program[i].hora==h):
                v[s]=i
                s+=1
        for j in range(s):
            for i in range(len(program[v[j]].dia)):
                    t=program[v[j]].dia.find(',')
                    if (t==-1):
                        break
                    else:
                        program[v[j]].dia=program[v[j]].dia[0:t]+program[v[j]].dia[t+1:len(program[v[j]].dia)]


        for i in range(s):
            print(program[v[i]].dia, end=" ")
            print(program[v[i]].nombre, end=" ")
            print('(',program[v[i]].genero,')',sep='')
        print()

    if (n==4):
    
        dur=[-1]*num_pro
        g=input('Género? ')
        print()
        for i in range(num_pro):
            if(program[i].genero==g):
                dur[i]=program[i].duracion
            else: 
                dur[i]=0

        for i in range(num_pro):
            for j in range(i,num_pro):
                 if(dur[i]<dur[j]):
                    aux=dur[i]
                    dur[i]=dur[j]
                    dur[j]=aux
        for i in range(num_pro):
            if(program[i].duracion==dur[0]):
                for j in range(len(program[i].dia)):
                    t=program[i].dia.find(',')
                    if (t==-1):
                        break
                    else:
                        program[i].dia=program[i].dia[0:t]+program[i].dia[t+1:len(program[i].dia)]
                print(program[i].dia, end=" ")
                print(program[i].hora, end=" ")
                print(program[i].nombre, end=" ")
                print(program[i].duracion, end=" ")
                print('minutos')
        print()

    if(n==5):

        for i in ["cine", "deportes", "informativos", "series", "otros"]:
            conta=0
            suma=0
            med=0
            for j in range(num_pro):
                if (program[j].genero==i):
                    conta+=1
                    suma=suma+program[j].duracion
            if (conta==0):
                med=0
                print(i, end=" ")
                print(format(med,".2f"), end= " ")
                print('minutos')
            else:
                med=med+suma/conta
                print(i, end=" ")
                print(format(med,".2f"), end= " ")
                print('minutos')
        print()
