program ycvghfbj
implicit none
real, allocatable,dimension(:) :: x,y,p,t
integer::i,j,m,n,s

interface
    function new(x,y,p)
        implicit none
        real:: x(:),y(:),p(:),nt(size(x),size(x)),new(size(p)),c(size(x)),na(size(x)),sumatorio,igd(size(x))
        integer::n,i,s,t,j,r
    end function

    function dif(x,y,p)
        implicit none
        real:: x(:),y(:),p(:),aux,f(size(x),size(x)),ss(size(x)),fin(size(x)),suma,dif(size(x)),fact
        integer:: i,j,n,s,t
    end function
end interface

write(*,*) 'deme la dimension de x'
read(*,*) n
allocate(x(n))
open(1,file='nodos.txt')
do i=1,n
    read(1,*) x(i)
end do

write(*,*) 'deme la dimension de y'
read(*,*) m
allocate(y(m))
open(3,file='nodos_imagenes.txt')
do i=1,m
    read(3,*) y(i)
end do

write(*,*) 'Deme la dimension de los puntos en los que quiere hacer la interpolacion'
read(*,*) s
allocate(p(s))
allocate(t(s))
open(2,file='puntos.txt')
do i=1,s
    read(2,*) p(i)
end do

t = new(x,y,p)
write(*,*) 'Imagenes de los puntos a interpolar'
do i=1,s
    write(*,*) t(i)
end do

t = dif(x,y,p)
do i=1,s
    write(*,*) t(i)
end do

end program

function dif(x,y,p)
implicit none
real:: x(:),y(:),p(:),aux,f(size(x),size(x)),ss(size(x)),fin(size(x)),suma,dif(size(x)),fact
integer:: i,j,n,s,t
n=size(x)
s=size(p)

do i=1,n-1
    do j=i+1,n
        if(x(i)<x(j)) then
            aux=x(i)
            x(i)=x(j)
            x(j)=aux
        end if
    end do
end do

do i=1,n
    f(i,1)=y(i)
end do

do i=2,n
    do j=1,n+(-i+1)
        f(j,i)=f(j+1,i-1)-f(j,i-1)
    end do
end do

do i=1,n
    fin(i)=f(1,i)
end do

do i=1,s
    ss(i)=(p(i)-x(1))/(x(2)-x(1))
end do

do t=1,s
    dif(t)=y(1)
    suma=1
    do j=1,n
        suma=suma*(ss(t)-(j-1))/j    
        dif(t)=dif(t)+(suma*fin(j))
    end do    
end do

end function

function new(x,y,p)
implicit none
real:: x(:),y(:),p(:),nt(size(x),size(x)),new(size(p)),c(size(x)),na(size(x)),sumatorio,igd(size(x))
integer::n,i,s,t,j,r

n=size(x)
s=size(p)

do j=1,n
    do i=1,n
        nt(i,j)=1
    end do
end do

do j=1,n
    do i=1,n
        do t=1,i-1
            nt(j,i)=nt(j,i)*(x(j)-x(t))
        end do
    end do
end do

do i=1,n
    nt(i,1)=1
end do

c(1)=y(1)
do i=1,n
    sumatorio=0
    do j=1,i-1
        sumatorio=sumatorio+nt(i,j)*c(j)
        c(i)=(1/nt(i,i))*(y(i)-sumatorio)
    end do
end do

do i=1,n
    igd(i)=0
    do j=1,i
        igd(i)=igd(i)+nt(i,j)*c(j)
    end do
end do

do t=1,s
    new(t)=c(1)
    do i=1,n
        na(i)=1
        do j=1,i
            na(i)=na(i)*(p(t)-x(j))
        end do    
        new(t)=new(t)+na(i)*c(i+1)
    end do
end do

end function
