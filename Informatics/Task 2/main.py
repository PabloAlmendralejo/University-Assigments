'''
Variables
n,u,num[10],cont[10],posiciones[10],m,t,ma[7][7],ac,bc,a,b : int
cad1,cad2,cadfin : str
pa,pb : float

'''

n=0
while (n!=4):

    if(n==1):
        print()

    print()
    print("1. Coincide suma izquierda en vector")
    print()
    print("2. Eliminar caracteres de una cadena")
    print()
    print("3. Porcentaje de valores mayores y menores")
    print()
    print("4. Salir")
    n=int(input("Opción:"))

    if(n==1):
        num=[-1]*10
        cont=[-1]*10
        for i in range(10):
            num[i]=int(input())
        
        for i in range(10):
            cont[i]=0
            for j in range(i):
                cont[i]=cont[i]+num[j]
        posiciones=[-1]*10
        u=0
        for i in range(10):
            if (cont[i]==num[i]):
                
                posiciones[u]=i+1
                u+=1

        print("Posiciones:",end=" ")
        for i in range(u):
            print(posiciones[i],end=" ")


        
        
    if (n==2):

        cad1=input()
        cad2=input()
        t= [-1.]*len(cad1)
            
        for i in range(len(cad2)):
            for _ in range(len(cad1)):
                t=cad1.find(cad2[i])
                if (t==-1):
                    break
                else:
                    cad1=cad1[0:t]+cad1[t+1:len(cad1)]


        print("Resultado:",cad1)
    if (n==3):

        while True:
            m=int(input()) 
            if(m>1 and m<7):
                break
            else:
                print("Error: dimensión no permitida")
        
        while True: 
            t=int(input())
            if(t>1 and t<7):
                break
            else:
                print("Error: dimensión no permitida")
    
        ma=[]
        for i in range(m):
            ma.append([-1]*(t))
    
        for i in range(m):
            for j in range(t):
                while True:
                    ma[i][j]=int(input())
                    if (ma[i][j]>0):
                        break
                    else:
                        print("Error: el valor debe ser positivo")

        a=int(input())
        b=int(input())
        ac=bc=0
        for i in range(m):
            for j in range(t):
                if (ma[i][j]>a):
                    ac+=1
                if(ma[i][j]<b):
                    bc+=1
        
        pa=(ac/(m*t))*100
        pb=(bc/(m*t))*100

        print("Porcentaje de valores mayores que",a,":",format(pa,".1f"),"%")
        print("Porcentaje de valores menores que",b,":",format(pb,".1f"),"%")

    
