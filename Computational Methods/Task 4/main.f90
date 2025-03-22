function gauss(a,n,b)
  implicit none
  real, allocatable:: a(:,:),b(:)
  integer:: n,i,j,k,m,t,imax,h
  real:: sumatorio,auxb
  real, dimension(n):: gauss,aux

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

program ejer3
  implicit none
  real, allocatable:: a(:,:),b(:),x(:)
  integer:: i,j,n,m

  interface
    function gauss(a,n,b)
      real, allocatable:: a(:,:),b(:)
      integer:: n,i,j,k,m,t,imax,h
      real:: sumatorio,auxb
      real:: gauss(size(b)),aux(size(b))
    end function
  end interface

  write(*,*) 'Enter the dimension of the matrix'
  read(*,*) n
  allocate(a(n,n))

  write(*,*) 'Enter the matrix coefficients row by row'
  do i=1,n
    do j=1,n
      read(*,*) a(i,j)
    end do
  end do
  write(*,*) 'Enter the dimension of the vector'
  read(*,*) m
  allocate(b(m))
  allocate(x(m))

  write(*,*) 'Enter the values of the vector'
  do i=1,m
    read(*,*) b(i)
  end do

  write(*,*) gauss(a,n,b)
  do i=1,n
    write(*,*) (a(i,j),j=1,n)
  end do

end program
