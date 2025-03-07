'''
This program registers max and min tempresature of each day
Constantes
'''
Dias=31*12
'''
Tipos
    Registro Dia
        dia : int
        mes : int
        min : float
        max : float
    fin registro

Variables
n,cont,tam,mes,dia,m1,d1,m2,d2,i,j : int
v,aemet,aux : Dia
media,res,resu,resur,min,max : flaot
'''

# Tipos
class Dia:
    def __init__ (self):
        self.dia= 0
        self.mes= 0
        self.min= 0.0
        self.max= 0.0

v = [Dia() for i in range(Dias)]
aemet= [Dia() for i in range(Dias)]
aux= [Dia() for i in range(Dias)]
cont=0
tam=0

# Modulos
def registra_temp(dia : int, mes : int, max : float, min : float, v : list,tam : int):
    '''
    Variables locales
    v[Dia]: Dia
    '''
    v[tam].min=min
    v[tam].max=max
    v[tam].mes=mes
    v[tam].dia=dia

def min_temp_dia(num_mes: int, num_dia : int, v: list)-> float:
    '''
    Variables locales
    v[Dias] : Dia
    i : int
    '''
    for i in range(Dias):
        if(v[i].dia==num_dia and v[i].mes==num_mes):
            return v[i].min

def max_temp_dia(num_mes: int, num_dia : int,v: list)-> float:
    '''
    Variables locales
    v[Dias] : Dia
    i : int
    '''
    for i in range(Dias):
        if(v[i].dia==num_dia and v[i].mes==num_mes):
            return v[i].max

def media_temp_intervalo(num_mes1 : int ,num_dia1: int , num_mes2 : int ,num_dia2: int, v : list,tam : int)-> float:
    '''
    Variables locales
    v[Dias] : Dia
    media : float
    cont,i : int
    '''
    cont=0
    media=0.0
    for i in range(tam):
        if((v[i].dia+(v[i].mes-1)*31)>=(num_dia1+(num_mes1-1)*31)):
            if((v[i].dia+(v[i].mes-1)*31)<=(num_dia2+(num_mes2-1)*31)):
                    cont+=1
                    media=media+((max_temp_dia(v[i].mes,v[i].dia,aemet)+min_temp_dia(v[i].mes,v[i].dia,aemet))/2)

    return media/cont

def min_temp_intervalo(num_mes1 : int ,num_dia1: int , num_mes2 : int ,num_dia2: int,v : list)-> float:
    '''
    Variables locales
    v[Dias],aux[Dias]  : Dia
    min,sop : float
    u,i,j : int
    '''

    u=0
    
    for i in range(Dias):
        if(((v[i].dia)+(v[i].mes-1)*31)>=(num_dia1+ (num_mes1-1)*31)):
            if((v[i].dia+(v[i].mes-1)*31)<=(num_dia2+ (num_mes2-1)*31)):
                aux[u]=v[i]
                u+=1
    for i in range(u):
        for j in range(i,u):
            aux[i].min=min_temp_dia(aux[i].mes,aux[i].dia,aemet)
            aux[j].min=min_temp_dia(aux[j].mes,aux[j].dia,aemet)
            if(aux[i].min>aux[j].min):
                sop=aux[i].min
                aux[i].min=aux[j].min
                aux[j].min=sop

    return aux[0].min

def max_temp_intervalo(num_mes1 : int ,num_dia1: int , num_mes2 : int ,num_dia2: int, v : list)-> float:
    '''
    Variables locales
    v[Dias],aux[Dias]  : Dia
    min,sop : float
    u,i,j : int
    '''

    u=0
    for i in range(Dias):
        if((v[i].dia+(v[i].mes-1)*31)>=(num_dia1+ (num_mes1-1)*13)):
            if((v[i].dia+(v[i].mes-1)*31)<=(num_dia2+ (num_mes2-1)*31)):
                aux[u]=v[i]
                u+=1
    for i in range(u):
        for j in range(i,u):
            aux[i].max=max_temp_dia(aux[i].mes,aux[i].dia,aemet)
            aux[j].max=max_temp_dia(aux[j].mes,aux[j].dia,aemet)
            if(aux[i].max<aux[j].max):
                sop=aux[i].max 
                aux[i].max=aux[j].max
                aux[j].max=sop

    return aux[0].max


def check_intervalo(num_mes1 : int ,num_dia1: int , num_mes2 : int ,num_dia2: int)-> bool:
    '''
    Variables locales
    
    '''
    if(((num_mes1-1)*31+num_dia1)<((num_mes2-1)*31+num_dia2)):
        return True
    else:
        return False


# Tipos "inmutables": int,float,bool,stR
# Tipos "mutables": array,registros

# Inicializacion de variables

#Inicio
n=0
while(n!=5):

    print("1. Registrar temperatura")
    print()
    print("2. Mínima intervalo")
    print()
    print("3. Máxima intervalo")
    print()
    print("4. Media intervalo")
    print()
    print("5. Salir")
    print()
    n=int(input("Opción:"))

    if (n==1):
        min=float(input())
        max=float(input())
        while True:
            mes=int(input())
            if(mes>=1 and mes<=12):
                break
        while True:
            dia=int(input())
            if(dia>=1 and dia<=31):
                break    
    
        registra_temp(dia,mes,max,min,aemet,cont)
        cont+=1
    if(n==2):


        while True:
            m1=int(input())
            d1=int(input())
            m2=int(input())
            d2=int(input())
            comp=check_intervalo(d1,m1,d2,m2)
            if(comp==True):
                break
            else:
                print("Error: intervalo incorrecto")

        res=min_temp_intervalo(m1,d1,m2,d2,aemet)
        print()
        print("La temperatura mínima del intervalo es",format(res,".1f"))
        print()

    if(n==3):

        while True:
            m1=int(input("Dia 1?"))
            d1=int(input("Mes 1?"))
            m2=int(input("Dia 2?"))
            d2=int(input("Mes 2?"))
            comp=check_intervalo(m1,d1,m2,d2)
            if(comp==True):
                break
            else:
                print("Error: intervalo incorrecto")
                continue

        resu=max_temp_intervalo(m1,d1,m2,d2,aemet)
        print()
        print("La temperatura máxima del intervalo es ",format(resu,".1f"))
        print()
    if(n==4):


        while True:
            m1=int(input("Dia 1?"))
            d1=int(input("Mes 1?"))
            m2=int(input("Dia 2?"))
            d2=int(input("Mes 2?"))
            comp=check_intervalo(m1,d1,m2,d2)
            if(comp==True):
                break
            else:
                print("Error: intervalo incorrecto")
                continue

        resur=media_temp_intervalo(m1,d1,m2,d2,aemet,cont)
        print()
        print("La temperatura media del intervalo es ",format(resur,".1f"))
        print()
