program main
! measure general performance by operating on 1 000 000, random values
use M_sets, only: unique, intersect, union, setdiff, ismember, setxor, bool
implicit none
real    :: valsr(1000000)
integer, allocatable :: A(:)
integer, allocatable :: B(:)
integer, allocatable :: C(:)
integer :: i
character(len=*),parameter :: g='(*(g0,1x))'

   call random_seed()
   do i = 1, 10
      call random_number(valsr)
      A = valsr*20.0 - 10.0
      B=[(i,i=-10,10)]
      write(*,g) A
      C = unique(A)
      write (*, g) 'UNIQUE:    NUMBER OF VALUES RETURNED:', size(C),C
      C = intersect(A,B)
      write (*, g) 'INTERSECT: NUMBER OF VALUES RETURNED:', size(C),C
      C = union(A,B)
      write (*, g) 'UNION:     NUMBER OF VALUES RETURNED:', size(C),C
      C = setdiff(A,B)
      write (*, g) 'SETDIFF:   NUMBER OF VALUES RETURNED:', size(C),C
      C = ismember(A,B)
      write (*, g) 'ISMEMBER:  NUMBER OF VALUES RETURNED:', size(C)
      C = setxor(A,B)
      write (*, g) 'SETXOR:    NUMBER OF VALUES RETURNED:', size(C),C
   end do

end program main
