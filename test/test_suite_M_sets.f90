program runtest
use M_framework
use M_sets, only: unique, intersect, union, setdiff, ismember, setxor, issorted
!
implicit none
integer, allocatable       :: A(:)
integer, allocatable       :: B(:)
integer, allocatable       :: C(:)
integer, allocatable       :: expected(:)
character(len=:), allocatable       :: strA(:)
character(len=:), allocatable       :: strB(:)
character(len=:), allocatable       :: strC(:)
character(len=:),allocatable        :: strexpected(:)

   unit_check_level=0

   call test_unique()
   call test_intersect()
   call test_union()
   call test_setdiff()
   call test_ismember()
   call test_setxor()
   call test_issorted()

   call unit_check_stop()

contains
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_unique
   call unit_check_start('unique', 'find the unique elements of vactor A') ! start tests

   A = [10, -10, 0, 1, 2, 3, 3, 2, 1, -10]
   strA = ['ab', 'AB', 'zz', 'mq', 'qm', 'mq', 'Za', 'zz', 'bb', 'qm']

   C = unique(A)
   expected=[-10, 0, 1, 2, 3, 10]
   call unit_check('unique', all(C .eq. expected),'sorted, expected',str(expected),'got',str(C))
   call unit_check('unique',size(C).eq.6,'sorted size')

   C = unique(A, setOrder='stable')
   expected=[10, -10, 0, 1, 2, 3]
   call unit_check('unique', all(C .eq. expected),'stable, expected',str(expected),'got',str(C))
   call unit_check('unique',size(C).eq.6,'stable size')

   strC = unique(strA,setorder='stable')
   strexpected=['ab','AB','zz','mq','qm','Za','bb']
   call unit_check('unique', all(strC .eq. strexpected),'stable, expected',str(strexpected),'got',str(strC))
   call unit_check('unique',size(strC).eq.7,'sorted size')

   strC = unique(strA,setorder='sorted')
   strexpected=["AB", "Za", "ab", "bb", "mq", "qm", "zz"]
   call unit_check('unique', all(strC .eq. strexpected),'sorted, expected',str(strexpected),'got',str(strC))
   call unit_check('unique',size(strC).eq.7,'sorted size')

   call unit_check_done('unique',msg='test completed')
end subroutine test_unique
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_union
   call unit_check_start('union', 'find the unique elements of vactors A and B') ! start tests

   A = [5, 7, 1]
   B = [3, 1, 1]

   C = union(A,B)
   expected=[1, 3, 5, 7]
   call unit_check('union', all(C .eq. expected),'default, expected',str(expected),'got',str(C))
   call unit_check('union',size(C).eq.4,'sorted size')

   A = [5, 5, 3]
   B = [1, 2, 5]

   C = union(A, B, 'sorted')
   expected=[1,2,3,5]
   call unit_check('union', all(C .eq. expected),'sorted, expected',str(expected),'got',str(C))
   call unit_check('union',size(C).eq.4,'sorted size')

   C = union(A, B, 'stable')
   expected=[5,3,1,2 ]
   call unit_check('union', all(C .eq. expected),'stable, expected',str(expected),'got',str(C))
   call unit_check('union',size(C).eq.4,'stable size')

   strA = ["5", "7", "1"]
   strB = ["3", "1", "1"]

   strC = union(strA,strB)
   strexpected=["1", "3", "5", "7"]
   call unit_check('union', all(strC .eq. strexpected),'default, expected',str(strexpected),'got',str(strC))
   call unit_check('union',size(strC).eq.4,'default size','expected',4,'got',size(strC))

   strA = ["5", "5", "3"]
   strB = ["1", "2", "5"]

   strC = union(strA, strB, 'sorted')
   strexpected=["1","2","3","5"]
   call unit_check('union', all(strC .eq. strexpected),'sorted, expected',str(strexpected),'got',str(strC))
   call unit_check('union',size(strC).eq.4,'sorted size','expected',4,'got',size(strC))

   strC = union(strA, strB, 'stable')
   strexpected=["5","3","1","2" ]
   call unit_check('union', all(strC .eq. strexpected),'stable, expected',str(strexpected),'got',str(strC))
   call unit_check('union',size(strC).eq.4,'stable size','expected',4,'got',size(strC))


   call unit_check_done('union',msg='test completed')

end subroutine test_union
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_intersect
   call unit_check_start('intersect', 'find the values common to both A and B') ! start tests

   A = [7, 1, 7, 7, 4]
   B = [7, 0, 4, 4, 0]

   C = intersect(A,B)
   expected=[4, 7]
   call unit_check('intersect',size(C).eq.2,'sorted size','expected',2,'got',size(c))
   if(size(C).eq.2)then
      call unit_check('intersect', all(C .eq. expected),'sorted, expected',str(expected),'got',str(C))
   endif

   C = intersect(A, B, 'stable')
   expected=[7, 4 ]
   call unit_check('intersect',size(C).eq.2,'stable size','expected',2,'got',size(c))
   if(size(C).eq.2)then
      call unit_check('intersect', all(C .eq. expected),'stable, expected',str(expected),'got',str(C))
   endif

   strA = [ "7", "1", "7", "7", "4" ]
   strB = [ "7", "0", "4", "4", "0" ]

   strC = intersect(strA,strB)
   strexpected=["4", "7"]
   call unit_check('intersect',size(strC).eq.2,'sorted size','expected',2,'got',size(strc),'output=',str(strC))
   if(size(C).eq.2)then
      call unit_check('intersect', all(strC .eq. strexpected),'sorted, expected',str(strexpected),'got',str(strC))
   endif

   strC = intersect(strA, strB, 'stable')
   strexpected=["7", "4" ]
   call unit_check('intersect',size(strC).eq.2,'stable size','expected',2,'got',size(strc),'output=',str(strc))
   if(size(C).eq.2)then
      call unit_check('intersect', all(strC .eq. strexpected),'stable, expected',str(strexpected),'got',str(strC))
   endif

   call unit_check_done('intersect',msg='test completed')
end subroutine test_intersect
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_setdiff
   call unit_check_start('setdiff', 'find the values in A that are not in B') ! start tests

   A = [3, 6, 2, 1, 5, 1, 1]
   B = [2, 4, 6]

   C = setdiff(A,B)
   expected=[1,3,5]
   call unit_check('setdiff',size(C).eq.3,'sorted size')
   call unit_check('setdiff', all(C .eq. expected),'sorted, expected',str(expected),'got',str(C))

   A = [4, 1, 3, 2, 5]
   B = [2, 1]

   C = setdiff(A, B, 'sorted')
   expected=[3, 4, 5]
   call unit_check('setdiff',size(C).eq.3,'stable size')
   call unit_check('setdiff', all(C .eq. expected),'stable, expected',str(expected),'got',str(C))

   C = setdiff(A, B, 'stable')
   expected=[4, 3, 5 ]
   call unit_check('setdiff',size(C).eq.3,'stable size')
   call unit_check('setdiff', all(C .eq. expected),'stable, expected',str(expected),'got',str(C))
   
   strA = ['3', '6', '2', '1', '5', '1', '1']
   strB = ['2', '4', '6']

   strC = setdiff(strA,strB)
   strexpected=['1','3','5']
   call unit_check('setdiff',size(strC).eq.3,'sorted size')
   call unit_check('setdiff', all(strC .eq. strexpected),'sorted, expected',str(strexpected),'got',str(strC))

   strA = ['4', '1', '3', '2', '5']
   strB = ['2', '1']

   strC = setdiff(strA, strB, 'sorted')
   strexpected=['3', '4', '5']
   call unit_check('setdiff',size(strC).eq.3,'stable size')
   call unit_check('setdiff', all(strC .eq. strexpected),'stable, expected',str(strexpected),'got',str(strC))

   strC = setdiff(strA, strB, 'stable')
   strexpected=['4', '3', '5' ]
   call unit_check('setdiff',size(strC).eq.3,'stable size')
   call unit_check('setdiff', all(strC .eq. strexpected),'stable, expected',str(strexpected),'got',str(strC))

   call unit_check_done('setdiff',msg='test completed')
end subroutine test_setdiff
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_setxor
   call unit_check_start('setxor', 'find values two vectors do not share') ! start tests

   A = [5,1,3,3,3]
   B = [4,1,2]

   C = setxor(A,B)
   expected=[2,3,4,5]
   call unit_check('setxor', all(C .eq. expected),'sorted, expected',str(expected),'got',str(C))
   call unit_check('setxor',size(C).eq.4,'sorted size')

   C = setxor(A, B, 'stable')
   expected=[5, 3, 4, 2 ]
   call unit_check('setxor', all(C .eq. expected),'stable, expected',str(expected),'got',str(C))
   call unit_check('setxor',size(C).eq.4,'stable size')

   strA = ["5","1","3","3","3"]
   strB = ["4","1","2"]

   strC = setxor(strA,strB)
   strexpected=["2","3","4","5"]
   call unit_check('setxor',size(strC).eq.4,'sorted size')
   call unit_check('setxor', all(strC .eq. strexpected),'sorted, expected',str(strexpected),'got',str(strC))

   strC = setxor(strA, strB, 'stable')
   strexpected=["5", "3", "4", "2" ]
   call unit_check('setxor',size(strC).eq.4,'stable size')
   call unit_check('setxor', all(strC .eq. strexpected),'stable, expected',str(strexpected),'got',str(strC))

   call unit_check_done('setxor',msg='test completed')
end subroutine test_setxor
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_ismember
call unit_check_start('ismember', 'report which values in A are also in B') ! start tests
! ! Create two vectors with values in common.

   A = [5,3,4,2]
   B = [2,4,4,4,6,8]

   C = ismember(A,B)
   expected=[0,0,1,1]
   call unit_check('ismember',size(C).eq.4,'sorted size')
   if(size(C).eq.4)then
      call unit_check('ismember', all(C .eq. expected),'sorted, expected',str(expected),'got',str(C))
   endif

   strA = ["5","3","4","2"]
   strB = ["2","4","4","4","6","8"]

   C = ismember(strA,strB)
   expected=[0,0,1,1]
   call unit_check('ismember',size(C).eq.4,'sorted size')
   if(size(C).eq.4)then
      call unit_check('ismember', all(C .eq. expected),'sorted, expected',str(expected),'got',str(C))
   endif
   call unit_check_done('ismember',msg='test completed')
end subroutine test_ismember
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_issorted
use M_sets, only: issorted

   call unit_check_start( 'issorted','Find the issorted elements of vector A.')

   A = [10, -10, 0, 1, 2, 3, 3, 2, 1, -10]
   call unit_check('issorted', issorted(A).eq.0,'sorted, expected 0 got',issorted(A))

   A = [-10, 10, 100, 201]
   call unit_check('issorted', issorted(A).eq.1,'sorted, expected 1 got',issorted(A))

   strA = ["0", "0", "1", "2", "3", "3", "2", "1" ]
   call unit_check('issorted', issorted(strA).eq.0,'sorted, expected 0 got',issorted(strA))

   strA = [ "10", "20", "30"]
   call unit_check('issorted', issorted(strA).eq.1,'sorted, expected 1 got',issorted(strA))

end subroutine test_issorted
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
end program runtest
