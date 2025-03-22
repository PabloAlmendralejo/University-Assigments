module ODEModule
  implicit none
  private
  public :: dif1, dif2

contains

  real function dif1(x, y)
    real, intent(in) :: x, y
    dif1 = (1.0 - (0.1 * x)) * y
  end function dif1

  real function dif2(x, y)
    real, intent(in) :: x, y
    dif2 = (-1.0 / 8000.0) * y
  end function dif2

end module ODEModule

module NumericalMethodsModule
  implicit none
  private
  public :: solve_ode, explicit_euler, centered_difference, heun_method

contains

  subroutine explicit_euler(x, y0, h, f, y)
    real, intent(in) :: x(0:), y0, h
    real, intent(out) :: y(0:)
    interface
      real function f(x, y)
        real, intent(in) :: x, y
      end function f
    end interface

    integer :: i, n
    n = size(x) - 1
    y(0) = y0
    do i = 0, n - 1
      y(i + 1) = y(i) + h * f(x(i), y(i))
    end do
  end subroutine explicit_euler

  subroutine centered_difference(x, y0, h, f, t)
    real, intent(in) :: x(0:), y0, h
    real, intent(out) :: t(0:)
    interface
      real function f(x, y)
        real, intent(in) :: x, y
      end function f
    end interface

    integer :: i, n
    n = size(x) - 1
    t(0) = y0
    t(1) = y0 + h * f(x(0), y0) 
    do i = 0, n - 2
      t(i + 2) = t(i) + 2.0 * h * f(x(i + 1), t(i + 1))
    end do
  end subroutine centered_difference

  subroutine heun_method(x, y0, h, f, z)
    real, intent(in) :: x(0:), y0, h
    real, intent(out) :: z(0:)
    interface
      real function f(x, y)
        real, intent(in) :: x, y
      end function f
    end interface

    integer :: i, n
    real :: z1, z2
    n = size(x) - 1
    z(0) = y0
    do i = 0, n - 1
      z1 = x(i) + h
      z2 = z(i) + h * f(x(i), z(i))
      z(i + 1) = z(i) + (h / 2.0) * (f(z1, z2) + f(x(i), z(i)))
    end do
  end subroutine heun_method

  subroutine solve_ode(x, y0, h, f, y, t, z)
    real, intent(in) :: x(0:), y0, h
    real, intent(out) :: y(0:), t(0:), z(0:)
    interface
      real function f(x, y)
        real, intent(in) :: x, y
      end function f
    end interface

    call explicit_euler(x, y0, h, f, y)
    call centered_difference(x, y0, h, f, t)
    call heun_method(x, y0, h, f, z)
  end subroutine solve_ode

end module NumericalMethodsModule

program ultimooo2
  use ODEModule
  use NumericalMethodsModule
  implicit none
  integer :: x11, x1o, x22, x2o, i, s1, s2
  real :: y1o, h1, y2o, h2
  real, allocatable :: x1(:), y1(:), t1(:), z1(:)

  write(*,*) 'Para la f de trabajo 1 deme el punto x final, el inicial, el punto y inicial y el paso h'
  read(*,*) x11, x1o, y1o, h1

  s1 = abs(x11 - x1o) / h1
  allocate(x1(0:s1))
  allocate(y1(0:s1))
  allocate(t1(0:s1))
  allocate(z1(0:s1))

  x1(0) = x1o
  do i = 0, s1 - 1
    x1(i + 1) = x1(i) + h1
  end do

  call solve_ode(x1, y1o, h1, dif1, y1, t1, z1)

  open(1, file='salida1.txt')
  do i = 1, s1
    write(1, *) x1(i), y1(i), t1(i), z1(i)
  end do
  close(1)

  write(*,*) 'Para la f de trabajo 2 deme el punto x final, el inicial, el punto y inicial y el paso h'
  read(*,*) x22, x2o, y2o, h2

  s2 = abs(x22 - x2o) / h2
  allocate(x2(0:s2))
  allocate(y2(0:s2))
  allocate(t2(0:s2))
  allocate(z2(0:s2))

  x2(0) = x2o
  do i = 0, s2 - 1
    x2(i + 1) = x2(i) + h2
  end do

  call solve_ode(x2, y2o, h2, dif2, y2, t2, z2)

  open(2, file='salida2.txt')
  do i = 1, s2
    write(2, *) x2(i), y2(i), t2(i), z2(i)
  end do
  close(2)

end program ultimooo2
