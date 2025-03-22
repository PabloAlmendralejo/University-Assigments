module root_finding_methods
  implicit none
contains
  ! Interface for root-finding functions
  interface
    function bisection(f, a1, a2, max_iter, precision)
      real :: bisection
      real :: a1, a2, precision
      integer :: max_iter
      interface
        function f(x)
          real :: x
          real :: f
        end function f
      end interface
    end function bisection

    function false_position(f, a1, a2, max_iter, precision)
      real :: false_position
      real :: a1, a2, precision
      integer :: max_iter
      interface
        function f(x)
          real :: x
          real :: f
        end function f
      end interface
    end function false_position

    function newton_raphson(f, pda, max_iter, precision)
      real :: newton_raphson
      real :: pda, precision
      integer :: max_iter
      interface
        function f(x)
          real :: x
          real :: f
        end function f
      end interface
    end function newton_raphson
  end interface

  ! Root-finding using Bisection Method
  function bisection(f, a1, a2, max_iter, precision)
    real :: bisection
    real :: a1, a2, precision
    integer :: max_iter, iter
    real :: f1, f2, t

    f1 = f(a1)
    f2 = f(a2)
    do iter = 1, max_iter
      t = (a1 + a2) / 2.0
      if (abs(f(t)) < precision) then
        bisection = t
        return
      end if
      if (f1 * f(t) < 0) then
        a2 = t
      else
        a1 = t
      end if
    end do
    print *, "Max iterations reached without convergence."
    bisection = -1.0
  end function bisection

  ! Root-finding using False Position Method
  function false_position(f, a1, a2, max_iter, precision)
    real :: false_position
    real :: a1, a2, precision
    integer :: max_iter, iter
    real :: f1, f2, t

    f1 = f(a1)
    f2 = f(a2)
    do iter = 1, max_iter
      t = a1 - (f1 * (a2 - a1)) / (f2 - f1)
      if (abs(f(t)) < precision) then
        false_position = t
        return
      end if
      if (f1 * f(t) < 0) then
        a2 = t
      else
        a1 = t
      end if
    end do
    print *, "Max iterations reached without convergence."
    false_position = -1.0
  end function false_position

  ! Root-finding using Newton-Raphson Method
  function newton_raphson(f, pda, max_iter, precision)
    real :: newton_raphson
    real :: pda, precision
    integer :: max_iter, iter
    real :: f1, f2

    do iter = 1, max_iter
      f1 = f(pda)
      f2 = df(pda)  ! df is the derivative of the function
      pda = pda - f1 / f2
      if (abs(f1) < precision) then
        newton_raphson = pda
        return
      end if
    end do
    print *, "Max iterations reached without convergence."
    newton_raphson = -1.0
  end function newton_raphson
end module root_finding_methods

program root_finder
  use root_finding_methods
  implicit none

  integer :: max_iter, choice
  real :: precision, root
  real :: a1, a2

  print *, "Enter the method choice (1: Bisection, 2: False Position, 3: Newton-Raphson)"
  read(*,*) choice

  print *, "Enter the interval [a1, a2], precision, and maximum iterations"
  read(*,*) a1, a2, precision, max_iter

  select case (choice)
  case (1)
    print *, "Using Bisection Method"
    root = bisection(my_function, a1, a2, max_iter, precision)
  case (2)
    print *, "Using False Position Method"
    root = false_position(my_function, a1, a2, max_iter, precision)
  case (3)
    print *, "Using Newton-Raphson Method"
    root = newton_raphson(my_function, a1, max_iter, precision)
  case default
    print *, "Invalid choice"
    stop
  end select

  print *, "Root: ", root

contains

  function my_function(x)
    real :: my_function
    real :: x
    my_function = x**3 - 6.0*x**2 + 11.0*x - 6.0  ! Example cubic function
  end function my_function

  function df(x)
    real :: df
    real :: x
    df = 3.0*x**2 - 12.0*x + 11.0  ! Derivative of the function
  end function df

end program root_finder
