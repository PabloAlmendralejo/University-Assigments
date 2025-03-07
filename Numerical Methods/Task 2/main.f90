program principal
  implicit none
  external :: f1, f2
  integer :: cont1, cont2, c1, c2
  real :: x, a11, a12, a21, a22, b11, b21, b22, b12, r1, r2

  ! Read input for function 1
  write(*,*) 'deme la acotacion, la precision y las iteraciones para la funcion 1'
  read(*,*) a11, a12, b11, b12, c1

  ! Read input for function 2
  write(*,*) 'deme la acotacion, la precision y las iteraciones para la funcion 2'
  read(*,*) a21, a22, b21, b22, c2

  ! Call the bisection method for both functions
  call biseccion(f1, a11, a12, b11, b12, c1, cont1, r1)
  call biseccion(f2, a21, a22, b21, b22, c2, cont2, r2)

  ! Output results for function 1
  write(*,*) r1, cont1

  ! Output results for function 2
  write(*,*) r2, cont2
end program principal

program principal2
  implicit none
  external :: f1, f2
  integer :: cont12, cont21, c1, c2, cont11, cont22
  real :: x, a11, a12, a21, a22, b11, b21, b22, b12, r12, r21, r11, r22

  ! Read input for function 1
  write(*,*) 'deme la acotacion, la precision y las iteraciones para la funcion 1'
  read(*,*) a11, a12, b11, b12, c1

  ! Read input for function 2
  write(*,*) 'deme la acotacion, la precision y las iteraciones para la funcion 2'
  read(*,*) a21, a22, b21, b22, c2

  ! Call bisection and false position methods for both functions
  call biseccion(f1, a11, a12, b11, b12, c1, cont11, r11)
  call biseccion(f2, a21, a22, b21, b22, c2, cont12, r12)
  call fp(f1, a11, a12, b11, b12, c1, cont21, r21)
  call fp(f2, a21, a22, b21, b22, c2, cont22, r22)

  ! Display results for both methods
  write(*,*) 'metodo de la biseccion'
  write(*,*) r11, cont11
  write(*,*) r12, cont12

  write(*,*) 'metodo de la falsa posicion'
  write(*,*) r21, cont21
  write(*,*) r22, cont22
end program principal2

subroutine biseccion(f, a1, a2, b1, b2, c, cont, r)
  implicit none
  integer :: i, cont, c
  real :: b1, b2, a1, a2, r, t
  external :: f

  cont = 0
  do i = 1, c
    t = (a1 + a2) / (real(2) ** i)
    cont = cont + 1
    if (f(a1) * f(a2) .gt. 0) then
      write(*,*) 'no tiene raices en este intervalo'
      stop
    else if (t * f(a1) .lt. 0) then
      a1 = t
    else if ((t * f(a1)) .gt. 0) then
      a2 = t
    else if ((a2 - a1) .lt. b1) then
      stop
    else if (f(t) .lt. b2) then
      stop
    end if
  end do
  r = t
end subroutine biseccion

subroutine fp(f, a1, a2, b1, b2, c, cont, r)
  implicit none
  integer :: i, cont, c
  real :: b1, b2, a1, a2, r, t
  external :: f

  cont = 0
  do i = 1, c
    t = a1 - (f(a1) * (a2 - a1) / (f(a2) - f(a1)))
    cont = cont + 1
    if (f(a1) * f(a2) .gt. 0) then
      write(*,*) 'no tiene raices en este intervalo'
      stop
    else if (t * f(a1) .lt. 0) then
      a1 = t
    else if ((t * f(a1)) .gt. 0) then
      a2 = t
    else if ((a2 - a1) .lt. b1) then
      stop
    else if (f(t) .lt. b2) then
      stop
    end if
  end do
  r = t
end subroutine fp
