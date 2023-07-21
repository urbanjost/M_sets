   program demo_M_sets
   use M_sets, only: unique, intersect, union, setdiff, ismember, setxor
   character(len=*),parameter :: g='(*(g0,1x))'
   integer, allocatable      :: A(:)
   integer, allocatable      :: B(:)
   integer, allocatable      :: C(:)
   
      write(*,g) 'UNIQUE'
      write(*,g) 'Find the unique elements of vector A.'
      A = [10, -10, 0, 1, 2, 3, 3, 2, 1, -10]
      write(*,g) 'A=', A
      C = unique(A)
      write(*,g) C, all(C .eq. [-10, 0, 1, 2, 3, 10]), size(C) .eq. 6,'sort'
      C = unique(A, setOrder='stable')
      write(*,g) C, all(C .eq. [10, -10, 0, 1, 2, 3]), size(C) .eq. 6,'stable'
   
      write(*,g) 'UNION'
      write(*,g) 'Find the union of vectors A and B.'
      A = [5, 7, 1]
      B = [3, 1, 1]
   
      write(*,g) 'A=', A
      write(*,g) 'B=', B
      C = union(A, B)
      write(*,g) C, all(C .eq. [1, 3, 5, 7]), size(C) .eq. 4
   
      A = [5, 5, 3]
      B = [1, 2, 5]
      write(*,g) 'A=', A
      write(*,g) 'B=', B
      C = union(A, B, 'sorted')
      write(*,g) C, all(C .eq. [1, 2, 3, 5]), size(C) .eq. 4,'sorted'
   
      C = union(A, B, 'stable')
      write(*,g) C, all(C .eq. [5, 3, 1, 2]), size(C) .eq. 4,'stable'
   
      write(*,g) 'INTERSECT'
      write(*,g) 'Find the values common to both A and B.'

      ! Create two vectors that have some values in common.
      A = [7, 1, 7, 7, 4]
      B = [7, 0, 4, 4, 0]
      write(*,g) 'A=', A
      write(*,g) 'B=', B
   
      C = intersect(A, B)
      write(*,g) C, all(C .eq. [4, 7]), size(C) .eq. 2,'sorted'
   
      C = intersect(A, B, setOrder='stable')
      write(*,g) C, all(C .eq. [7, 4]), size(C) .eq. 2,'stable'
   
      write(*,g) 'SETDIFF'
   ! Define two vectors with values in common.
      A = [3, 6, 2, 1, 5, 1, 1]
      B = [2, 4, 6]
      write(*,g) 'A=', A
      write(*,g) 'B=', B
   
      write(*,g) 'Find the values in A that are not in B.'
   
      C = setdiff(A, B)
      write(*,g) C, all(C .eq. [1, 3, 5]), size(C) .eq. 3
   
      C = setdiff([4, 1, 3, 2, 5], [2, 1], 'sorted')
      write(*,g) C, all(C .eq. [3, 4, 5]), size(C) .eq. 3,'sorted'
   
   ! The values in C return in the same order as in A.
      C = setdiff([4, 1, 3, 2, 5], [2, 1], 'stable')
      write(*,g) C, all(C .eq. [4, 3, 5]), size(C) .eq. 3,'stable'
   
      write(*,g) 'ISMEMBER'
   ! Create two vectors with values in common.
      A = [5,3,4,2]
      B = [2,4,4,4,6,8]
      write(*,g) 'A=', A
      write(*,g) 'B=', B
      write(*,g) 'Determine which elements of A are also in B.'
      C = ismember(A,B)
      write(*,g) C, all(C .eq. [0,0,1,1]), size(C) .eq. 4
   
      write(*,g) 'SETXOR'
   ! Create two vectors with values in common.
   
      A = [5,1,3,3,3]
      B = [4,1,2]
      write(*,g) 'A=', A
      write(*,g) 'B=', B
   
   ! Find the values of A and B that are not in their intersection.
      C = setxor(A,B)
      write(*,g) C, all(C .eq. [ 2,3,4,5 ] ), size(C) .eq. 4,'sorted'
   
   ! Specify 'stable' if you want the values in C to have the same order as A and B.
      C = setxor(A,B,'stable')
      write(*,g) C, all(C .eq. [ 5,3,4,2 ] ), size(C) .eq. 4,'stable'
   
   end program demo_M_sets
