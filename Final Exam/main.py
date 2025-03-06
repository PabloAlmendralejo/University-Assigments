C_Plantas=7

C_Pacientes=20

P_max=7

P_min=1

'''
Tipos

    Registro Planta
        dia[C_Pacientes] : int
        numero[C_Pacientes] : int
        total : int
    fin_registro

Variables
    
    i,j,t,k,planta : int
    linea, cad1,cad2,b[C_Pacientes],aux[C_Pacientes] : str
    n[C_Plantas],nivel[C_Plantas] : Planta
    f : fichero

'''
# Tipos !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class Planta:
    def __init__(self):
        self.dia = [0]*C_Pacientes
        self.numero=[0]*C_Pacientes
        self.total=[0]
#Se me ocurre hacer un registro con dos arrays unidimensionales de enteros, en uno de ellos guardo el numero de un paciente y en el otro el numero de dias
#del paciente, ambos comparten el mismo indice
#una vez veo que piden los modulos creo que tambien añadire una variable entera para guardar el numero total de pacientes por planta

# Inicializacion de variables !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

nivel=[Planta() for _ in range(C_Plantas)]
n=[Planta() for _ in range(C_Plantas)]

# Modulos !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
def pacientes_por_planta(n : list):
    '''
    i : int
    '''
    for i in range(C_Plantas):
        print(f"Planta {i+1}: {n[i].total} pacientes")

def paciente_mas_antiguo_en_planta(n : list,planta : int)-> int:
        '''
        king,anaking,j : int
        '''
        planta=planta-1
        king=n[planta].dia[0]
        anaking=n[planta].numero[0]
        for j in range(n[planta].total):
            if(n[planta].dia[j]>king):
                king=n[planta].dia[j]
                anaking=n[planta].numero[j]
        return anaking

# Aquí en el bucle de indice "j" pongo como rango de 0 hasta n[i].total, se que tambien podria poner C_Pacientes pero creo que así queda mas elegante

def tiempo_promedio_planta(n : list):
    '''
    prom[C_Plantas],media[C_Plantas],i : int
    '''
    
    prom=[-1.0]*C_Plantas
    media=[-1.0]*C_Plantas
    for i in range(C_Plantas):
        prom[i]=0
        media[i]=0
        for j in range(n[i].total):
            prom[i]=prom[i]+n[i].dia[j]
        
    for i in range(C_Plantas):
        media[i]=prom[i]/n[i].total
        print(f"Planta", i+1,":",format(media[i],".1f")," días")


#Inicio !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#lo abrimos
try:
    f=open("pacientes.txt","tr",encoding="utf-8")
except IOError:
    print("Error al abrir fichero")
    exit()

aux=[" "]*C_Pacientes
#aquí voy linea por linea leyendo el fichero y guardando los datos necesarios
for linea in f:
    linea=linea[:-1]
    aux=linea.split(";")
    nivel[int(aux[0])-1].total=int(aux[1])
    # debo de restar 1 a int(aux[0]) - debido a que quiero que las plantas vayan acordes con el indice del array
    #en este bucle pretendo dividir cada una de las cadenas generadas en dos enteros, uno de ellos se lo asigno al numero de paciente y otro al numero de dias
    for j in range(2,int(aux[1])+2):
        t=aux[j].find(" ")
        #busco donde está el espacio
        b=aux[j]
        if (t!=-1):
            #separo los dos enteros pertenecientes la misma cadena
            cad1=b[0:t]
            cad2=b[t:len(aux[j])]
            i=int(aux[0])-1
            #los convierto en enteros (podria poner directamente int(aux[0]) como indice pero visualmente queda mejor así )
            nivel[i].dia[j-2]=int(cad2)
            nivel[i].numero[j-2]=int(cad1)

#bandera para ver si se ha guardado correctamente         
'''
for i in range(C_Plantas):
    for j in range(C_Pacientes):
        print(nivel[i].dia[j])
        print(nivel[i].numero[j])
'''

#Voy guardando por planta los pacientes con sus respectivos dias



n=-1
while(n!=4):

    print("Menú del programa:")
    print()
    print("1. Número de pacientes por planta")
    print()
    print("2. Paciente Mas antiguo en una planta")
    print()
    print("3. Tiempo promedio de ingreso por planta")
    print()
    print("4. Salir")
    print()
    n=int(input("Elíja una opción:"))

    if (n==1):
        pacientes_por_planta(nivel)

    if(n==2):
        while True:
            try:
                planta=int(input())
            except ValueError:
                print('El número debe de ser entero')
            if (planta>=P_min and planta<=P_max):
                break
        k=paciente_mas_antiguo_en_planta(nivel, planta)
        print(f"El paciente mas antiguo de la planta {planta} es el {k}")

    if(n==3):
        tiempo_promedio_planta(nivel)


#Fin              
