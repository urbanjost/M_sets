program main
use M_sets, only: unique, intersect, union, setdiff, ismember, setxor
implicit none
real    :: valsr(1000000)
integer, allocatable :: A(:)
integer, allocatable :: B(:)
integer, allocatable :: C(:)
integer :: i
   call random_seed()
   call random_number(valsr)
   A = valsr*20.0 - 10.0

   do i = 1, 10
      C = unique(A)
      write (*, *) 'NUMBER OF UNIQUE VALUES RETURNED:', size(C)
   end do

   B=[(i,i=-10,10)]

   do i = 1, 10
      C = intersect(A,B)
      write (*, *) 'NUMBER OF VALUES RETURNED:', size(C)
   end do

   do i = 1, 10
      C = union(A,B)
      write (*, *) 'NUMBER OF VALUES RETURNED:', size(C)
   end do

   do i = 1, 10
      C = setdiff(A,B)
      write (*, *) 'NUMBER OF VALUES RETURNED:', size(C)
   end do

   do i = 1, 10
      C = ismember(A,B)
      write (*, *) 'NUMBER OF VALUES RETURNED:', size(C)
   end do

   do i = 1, 10
      C = setxor(A,B)
      write (*, *) 'NUMBER OF VALUES RETURNED:', size(C)
   end do

end program main
