module IntegrationModule
  implicit none
  private
  public :: trap, nc, simp

contains

  ! Trapezoidal Rule Integration
  function trap(x, y, n) result(integral)
    real, intent(in) :: x(:), y(:)
    integer, intent(in) :: n
    real :: integral
    integer :: i

    integral = 0.0
    do i = 1, n - 1
      integral = integral + ((x(i + 1) - x(i)) / 2.0) * (y(i + 1) + y(i))
    end do
  end function trap

  ! Newton-Cotes Integration
  subroutine nc(li, ls, it, pr, f, area, cont)
    real, intent(in) :: li, ls, pr
    integer, intent(in) :: it
    real, intent(out) :: area
    integer, intent(out) :: cont
    interface
      real function f(x)
        real, intent(in) :: x
      end function f
    end interface

    integer :: i, j, nub
    real :: is(it), med(it, it), h(it), sumatorio, ta, c

    do i = 1, it
      h(i) = (ls - li) / (2.0 ** i)
    end do

    ta = li + h(1)
    is(1) = h(2) * (f(li) + 2.0 * f(ta) + f(ls))
    cont = 1

    do i = 2, it
      nub = 2 ** (i - 1)
      sumatorio = 0.0
      do j = 1, nub
        med(j, i) = li + (2.0 * j - 1.0) * h(i)
        sumatorio = sumatorio + f(med(j, i))
      end do
      is(i) = (is(i - 1) / 2.0) + (h(i) * sumatorio)
      cont = cont + 1

      c = is(i) - is(i - 1)
      if (abs(c) < pr) then
        area = is(i)
        return
      end if
    end do
    print *, 'Has superado las iteraciones'
  end subroutine nc

  ! Simpson's Rule Integration
  function simp(x, y, n) result(integral)
    real, intent(in) :: x(:), y(:)
    integer, intent(in) :: n
    real :: integral
    integer :: i

    integral = 0.0
    do i = 1, n - 2, 2
      integral = integral + ((x(i + 1) - x(i)) / 3.0) * (4.0 * y(i + 1) + y(i) + y(i + 2))
    end do
  end function simp

end module IntegrationModule

module FunctionModule
  implicit none
  private
  public :: f1, f2

contains

  ! Function 1: f(x) = x^2 - exp(x)
  real function f1(x)
    real, intent(in) :: x
    f1 = x**2 - exp(x)
  end function f1

  ! Function 2: f(x) = 1 / x
  real function f2(x)
    real, intent(in) :: x
    f2 = 1.0 / x
  end function f2

end module FunctionModule

module InterpolationModule
  implicit none
  private
  public :: inter

contains

  ! Polynomial Interpolation
  function inter(x, y, n) result(result)
    real, intent(in) :: x(:), y(:)
    integer, intent(in) :: n
    real :: result
    real :: va(n, n), coef(n), a
    integer :: i, j

    ! Vandermonde matrix
    do i = 1, n
      do j = 1, n
        va(i, j) = x(i) ** (j - 1)
      end do
    end do

    ! Solve system using Gaussian elimination
    coef = gauss(va, n, y)

    ! Compute integral of the polynomial
    a = 0.0
    do j = 1, n
      a = a - (coef(j) * x(1) ** j) + (coef(j) * x(n) ** j)
    end do
    result = a
  end function inter

  ! Gaussian Elimination
  function gauss(a, n, b) result(x)
    real, intent(in) :: a(n, n), b(n)
    integer, intent(in) :: n
    real :: x(n)
    integer :: i, j, k, m, t, imax
    real :: sumatorio, auxb
    real :: aux(n)

    t = n
    do k = 1, t - 1
      imax = maxloc(abs(a(k:n, k)), 1)
      m = k + imax - 1
      aux = a(k, :)
      a(k, :) = a(m, :)
      a(m, :) = aux

      auxb = b(k)
      b(k) = b(m)
      b(m) = auxb

      do i = k + 1, n
        b(i) = b(i) - (a(i, k) / a(k, k)) * b(k)
        do j = n, k, -1
          a(i, j) = a(i, j) - (a(i, k) / a(k, k)) * a(k, j)
        end do
      end do
    end do

    x(t) = b(t) / a(t, t)
    do i = t - 1, 1, -1
      sumatorio = 0.0
      do j = i + 1, t
        sumatorio = sumatorio + a(i, j) * x(j)
      end do
      x(i) = (b(i) - sumatorio) / a(i, i)
    end do
  end function gauss

end module InterpolationModule

program safyde
  use IntegrationModule
  use FunctionModule
  implicit none
  real :: li1, ls1, pr1, area1
  integer :: it1, cont1

  write(*, *) 'Para la primera funcion:'
  write(*, *) 'Deme los limites de integracion, las iteraciones y la precision, en ese orden:'
  read(*, *) li1, ls1, it1, pr1

  call nc(li1, ls1, it1, pr1, f1, area1, cont1)
  write(*, *) 'Area calculada:', area1, 'Iteraciones:', cont1
end program safyde

program dvufshb_trap
  use IntegrationModule
  implicit none
  real, allocatable :: x(:), y(:)
  real :: sol
  integer :: i, n

  write(*, *) 'Deme la dimension de x e y:'
  read(*, *) n

  allocate(x(n))
  allocate(y(n))

  open(1, file='nodos_imagenes10.txt')
  do i = 1, n
    read(1, *) x(i), y(i)
  end do
  close(1)

  sol = trap(x, y, n)
  write(*, *) 'Integral usando Trapecio:', sol
end program dvufshb_trap

program dvufshb_simp
  use IntegrationModule
  implicit none
  real, allocatable :: x(:), y(:)
  real :: sol
  integer :: i, n

  write(*, *) 'Deme la dimension de x e y:'
  read(*, *) n

  allocate(x(n))
  allocate(y(n))

  open(1, file='nodos_imagenes10.txt')
  do i = 1, n
    read(1, *) x(i), y(i)
  end do
  close(1)

  sol = simp(x, y, n)
  write(*, *) 'Integral usando Simpson:', sol
end program dvufshb_simp
