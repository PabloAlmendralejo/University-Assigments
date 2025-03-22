program dsaf
implicit none
integer::n1,n2
real::x1,h1,x2,h2,richi,t1,t2,e1(3),e2(3),error1,error2

interface
function funci1(x)
implicit none
real::x,funci1(3)
end function
end interface

interface
function funci2(x)
implicit none
real::x,funci2(3)
end function
end interface

write(*,*) 'Para la funcion 1:'
write(*,*) 'Deme el punto en el que quiere obtener las derivadas, deme el paso y deme el numero de iteraciones'
read(*,*) x1,h1,n1
write(*,*) 'Para la funcion 2:'
write(*,*) 'Deme el punto en el que quiere obtener las derivadas, deme el paso y deme el numero de iteraciones'
read(*,*) x2,h2,n2
e1=funci1(x1)
e2=funci2(x2)
t1=richi(funci1,h1,n1,x1)
t2=richi(funci2,h2,n2,x2)

error1=abs(e1(2)-t1)/max(e1(2),t1)
error2=abs(e2(2)-t2)/max(e2(2),t2)
write(*,*) t1,t2
write(*,*) error1,error2

end program

function gauss(a,n,b)
implicit none
real:: a(:,:),b(:)
integer:: n,i,j,k,m,t,imax,h
real:: sumatorio,auxb
real,dimension(n):: gauss,aux

t=n
do k=1,t-1
	h=k
	imax=maxloc(abs(a(k:n,k)),1)
	m=k+imax-1
	aux=a(h,1:n)
	a(h,1:n)=a(m,1:n)
	a(m,1:n)=aux(1:n)
			
	auxb=b(h)
	b(h)=b(m)
	b(m)=auxb
	do i=k+1,n
		b(i)=b(i)-(a(i,k)/a(k,k))*b(k)
		do j=n,k,-1
			a(i,j)=a(i,j)-(a(i,k)/a(k,k))*a(k,j)		
		end do
	end do
end do
gauss(t)=b(t)/a(t,t)
do i=t-1,1,-1
	sumatorio=0
	do j=i+1,t
		sumatorio=sumatorio+a(i,j)*gauss(j)
		gauss(i)=(1/a(i,i))*(b(i)-sumatorio)
	end do
end do

end function

subroutine inter(x,y,p,h,der1,der2)
implicit none
real:: x(:),y(:),p(:),h,t(size(x)),va(size(x),size(x)),im1(size(p)),im2(size(p)),im(size(p)),der1(size(p)),der2(size(p))
integer:: i,j,n,s

interface
function gauss(a,n,b)
implicit none
real:: a(:,:),b(:)
integer:: n,i,j,k,m,t,imax,h
real:: sumatorio,auxb
real,dimension(n):: gauss,aux
end function
end interface

s=size(p)
n=size(x)
do i=1,n
	do j=1,n
		va(i,j)=x(i)**(j-1)
	end do
end do

t=gauss(va,n,y)

do i=1,s
	do j=1,n
		im1(i)=im1(i)+t(j)*((p(i)-h)**(j-1))
	do i=1,s
	do j=1,n
		im2(i)=im2(i)+t(j)*((p(i)+h)**(j-1))
	do i=1,s
	der1(i)=(im2(i)-im1(i))/(2*h)

do i=1,s
	do j=1,n
		im(i)=im(i)+t(j)*(p(i)**(j-1))
	do i=1,s
	der2(i)=(im1(i)+im2(i)-(2*im(i)))/h**2

do i=1,n
	print*, im(i)
end do

end subroutine

real function richi(f,h,n,x)
implicit none
integer::n,k,i,j
real::h,d(0:n,0:n),der(3),izq(3),x,a1,a2,v

interface
function f(x)
implicit none
real::x,f(3)
end function
end interface

do k=0,n+1
	a1=x+(h/(2**k))
	a2=x-(h/(2**k))
	izq=f(a1)
	der=f(a2)
	d(k,1)=(izq(1)-der(1))/(2*(h/2**k))
end do

do i=1,n
	v=2**(2*i)
	do k=i,n
		d(k,i)=((v/(v-1))*d(k,i-1)) - ((1/(v-1))*d(k-1,i-1))
	end do
end do

richi=d(n,n)
end function

function funci2(x)
implicit none
real::x,funci2(3)

funci2(1)=x+log(x)
funci2(2)=1/x
funci2(3)=-1/(x**2)

end function

function funci1(x)
implicit none
real::x,funci1(3)

funci1(1)=x**2 - exp(x)
funci1(2)=2*x - exp(x)
funci1(3)=2 - exp(x)

end function

function der(f,x,h)
implicit none
real::der(4),x,h,cen(3),dere(3),izq(3)

interface
function f(x)
implicit none
real::x,f(3)
end function
end interface 

cen=f(x)
dere=f(x+h)
izq=f(x-h)

der(1)=(dere(1)-cen(1))/h
der(2)=(-izq(1)+cen(1))/h
der(3)=((dere(1)-izq(1))/(2*h))
der(4)=(dere(1)+izq(1)+(-2*cen(1)))/(h**2)

end function
