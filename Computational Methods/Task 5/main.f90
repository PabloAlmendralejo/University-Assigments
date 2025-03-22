program practfds
  implicit none
  integer:: i, j, n, k
  real, allocatable:: a(:,:), u(:,:), l(:,:), b(:), t(:)
  integer, allocatable:: v(:)

  ! Prompt user for matrix dimension and allocate memory
  write(*,*) 'Deme la dimension de la matriz'
  read(*,*) n

  allocate(a(n, n))
  allocate(u(n, n))
  allocate(l(n, n))
  allocate(v(n))
  allocate(b(n))
  allocate(t(n))

  ! Read the matrix coefficients
  write(*,*) 'Dime los indices de la matriz'
  do i = 1, n
    read(*,*) (a(i, j), j = 1, n)
  end do

  ! Read the vector of independent terms
  write(*,*) 'Dime los indices del vector'
  do i = 1, n
    read(*,*) b(i)
  end do

  ! Call the Gauss elimination method (LU decomposition)
  call gaussnueva(a, n, l, u, v)

  ! Display the L and U matrices
  write(*,*) 'Las matrices pedidas son:'
  do i = 1, n
    write(*,*) (u(i, j), j = 1, n)
  end do

  do i = 1, n
    write(*,*) (l(i, j), j = 1, n)
  end do

  write(*,*) 'El vector de pivoteamiento es: ', (v(i), i = 1, n)

  ! Solve the system L * U = A
  t = funcdoolite(a, b, n)

  ! Display the result vector (solution)
  write(*,*) 'La solución es:'
  do i = 1, n
    write(*,*) t(i)
  end do

end program

subroutine gaussnueva(a, n, l, u, v)
  implicit none
  integer:: n, i, j, k, m, imax, h
  real:: sumatorio, auxb
  real:: a(:,:), u(size(a, 1), size(a, 2)), l(size(a, 1), size(a, 2)), aux(size(a, 1)), auxl(size(a, 1))
  integer:: v(size(a, 1)), auxv

  ! Initialize pivot vector
  v = (/ (i, i = 1, n) /)

  ! LU decomposition using Gauss elimination
  do k = 1, n-1
    h = k
    imax = maxloc(abs(a(k:n, k)), 1)
    m = k + imax - 1
    ! Row swapping
    aux = a(h, 1:n)
    a(h, 1:n) = a(m, 1:n)
    a(m, 1:n) = aux(1:n)

    auxl = l(h, 1:n)
    l(h, 1:n) = l(m, 1:n)
    l(m, 1:n) = auxl(1:n)

    auxv = v(k)
    v(k) = v(m)
    v(m) = auxv

    ! Update L and U matrices
    do i = k+1, n
      l(i, k) = a(i, k) / a(k, k)
      l(k, i) = 0.0
      l(k, k) = 1.0
    end do

    ! Perform Gauss elimination
    do i = k+1, n
      do j = n, k, -1
        a(i, j) = a(i, j) - (a(i, k) / a(k, k)) * a(k, j)
      end do
    end do
  end do

  ! U is the upper triangular matrix
  u = a

end subroutine

function funcdoolite(a, b, n)
  implicit none
  integer:: n, i, j
  real:: a(:,:), b(:), funcdoolite(size(b)), bdes(size(b)), bprim(size(b)), u(size(b), size(b)), sumatorio, sumatorio2, l(size(b), size(b))
  integer:: v(size(b))

  ! Call Gauss elimination to get LU decomposition
  call gaussnueva(a, n, l, u, v)

  ! Compute forward substitution for L * y = b
  do i = 1, n
    bdes(i) = b(v(i))
  end do
  bprim(1) = bdes(1)

  do i = 2, n
    sumatorio = 0.0
    do j = 1, i-1
      sumatorio = sumatorio + bprim(j) * l(i, j)
    end do
    bprim(i) = bdes(i) - sumatorio
  end do

  ! Backward substitution for U * x = y
  funcdoolite(n) = bprim(n) / u(n, n)

  do i = n-1, 1, -1
    sumatorio2 = 0.0
    do j = i+1, n
      sumatorio2 = sumatorio2 + u(i, j) * funcdoolite(j)
    end do
    funcdoolite(i) = (bprim(i) - sumatorio2) / u(i, i)
  end do

end function
