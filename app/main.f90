program main
use M_sets, only: unique, intersect, union, setdiff, ismember, setxor, issorted
use M_CLI2, only: set_args, igets, sget, lget, sgets
implicit none
character(len=*),parameter :: g='(*(g0,1x))'
integer, allocatable       :: A(:)
integer, allocatable       :: B(:)
character(len=:),allocatable :: version_text(:), help_text(:)
character(len=:),allocatable :: setorder
character(len=:),allocatable :: datatype
character(len=:),allocatable :: strA(:),strB(:)
logical :: verbose
   call setup()
   call set_args('-a , -b , --setorder "sorted" --type "character"',help_text,version_text)
   datatype=sget('type')
   do
      select case(datatype)
      case('integer')
      a=igets('a')
      b=igets('b')
      setorder=sget('setorder')
      verbose=lget('verbose')
      if(size(a) == 0.and.size(b) == 0)then
         write(*,g)repeat('TEST OF SETTHEORY ',4)
         a = [7,23,14,15,9,12,8,24,35]
         b = [ 2,5,7,8,14,16,25,35,27]
         verbose=.true.
      endif
      if(verbose)write(*,g) '-------------: ', 'Given the sets'
      write(*,g) 'A            : ', a
      write(*,g) 'B            : ', b
      if(verbose)write(*,g) '-------------: ', 'Find the unique elements of vector A, then of B'
      write(*,g) 'UNIQUE       : ', unique(a,setorder=setorder),',',unique(b,setorder=setorder)
      if(verbose)write(*,g) '-------------: ', 'Find the unique union of vectors A and B.'
      write(*,g) 'UNION        : ', union(a, b, setorder=setorder)
      if(verbose)write(*,g) '-------------: ', 'Find the values common to both A and B.'
      write(*,g) 'INTERSECT    : ', intersect(a, b, setorder=setorder)
      if(verbose)write(*,g) '-------------: ', 'Find the values in A that are not in B.'
      write(*,g) 'SETDIFF      : ', setdiff(a, b, setorder=setorder)
      if(verbose)write(*,g) '-------------: ', 'Determine which elements of A are also in B by position.'
      write(*,g) 'ISMEMBER     : ', ismember(a, b)
      if(verbose)write(*,g) '-------------: ', 'Find values of A and B not in their intersection.'
      write(*,g) 'SETXOR       : ', setxor(a, b, setorder=setorder)

      case('character')
      stra=sgets('a')
      strb=sgets('b')
      setorder=sget('setorder')
      verbose=lget('verbose')
      if(size(stra) == 0.and.size(strb) == 0)then
         datatype='integer'
         cycle
      endif
      if(verbose)write(*,g) '-------------: ', 'Given the sets'
      write(*,g) 'A            : ', stra
      write(*,g) 'B            : ', strb
      if(verbose)write(*,g) '-------------: ', 'Find the unique elements of vector A, then of B'
      write(*,g) 'UNIQUE       : ', unique(stra,setorder=setorder),',',unique(strb,setorder=setorder)
      if(verbose)write(*,g) '-------------: ', 'Find the unique union of vectors A and B.'
      write(*,g) 'UNION        : ', union(stra, strb, setorder=setorder)
      if(verbose)write(*,g) '-------------: ', 'Find the values common to both A and B.'
      write(*,g) 'INTERSECT    : ', intersect(stra, strb, setorder=setorder)
      if(verbose)write(*,g) '-------------: ', 'Find the values in A that are not in B.'
      write(*,g) 'SETDIFF      : ', setdiff(stra, strb, setorder=setorder)
      if(verbose)write(*,g) '-------------: ', 'Determine which elements of A are also in B by position.'
      write(*,g) 'ISMEMBER     : ', ismember(stra, strb)
      if(verbose)write(*,g) '-------------: ', 'Find values of A and B not in their intersection.'
      write(*,g) 'SETXOR       : ', setxor(stra, strb, setorder=setorder)
      case default
              write(*,g)'<ERROR> type=',datatype,' allowed values are integer,character'
      end select
      exit
   enddo
contains
subroutine setup()
help_text=[ CHARACTER(LEN=128) :: &
'NAME',&
'   settheory(1f) - [FUNIX:FILESYSTEM] find the pathname of commands and',&
'              optionally perform commands on them.                     ',&
'   (LICENSE:MIT)                                                       ',&
'                                                                       ',&
'SYNOPSIS                                                               ',&
'    settheory -a INTEGER_SET_ONE -b INTEGER_SET_TWO                    ',&
'                                                                       ',&
'DESCRIPTION                                                            ',&
'   settheory(1f) finds the union, intersection, and setdiff of two     ',&
'   small sets of integers and displays them                            ',&
'                                                                       ',&
'   If any set is empty a simple example is run.                        ',&
'                                                                       ',&
'OPTIONS                                                                ',&
'    -a SET_ONE       vector of whole numbers or strings comprising     ',&
'                     set A. May be delimited by commas, spaces,        ',&
'                     or colons. If spaces are used the set needs       ',&
'                     quoted. If empty a test set is run.               ',&
'    -b SET_TWO       vector of whole numbers or strings comprising     ',&
'                     set B. May be delimited by commas, spaces,        ',&
'                     or colons. If spaces are used the set needs       ',&
'                     quoted. If empty a test set is run.               ',&
'    --type DATATYPE  May be "integer" or "character". Defaults to      ',&
'                     "character".                                      ',&
'    --setorder       "sorted" or "stable". If "stable" the values remain',&
'                     in the order input.                                ',&
'    --verbose        add additional descriptive text                    ',&
'    --version,-v     Print version information on standard output then  ',&
'                     exit successfully.                                 ',&
'    --help,-h        Print usage information on standard output then    ',&
'                     exit successfully.                                 ',&
'RESULTS                                                                 ',&
'                                                                        ',&
'  Outputs the results from the following calls to the M_set(3f) module  ',&
'                                                                        ',&
'   * unique(A,setOrder);unique(B,setOrder) - Unique values in each array',&
'   * union(A,B,setOrder) - Set union of two arrays                      ',&
'   * intersect(A,B,setOrder) - Set intersection of two arrays           ',&
'   * setdiff(A,B,setOrder) - Set difference of two arrays               ',&
'   * ismember(A,B) - Array elements of set B that are members           ',&
'                     of set A array                                     ',&
'   * setxor(A,B,setOrder) - Set exclusive OR of two arrays              ',&
'EXAMPLE                                                                 ',&
'   Sample commands                                                      ',&
'                                                                        ',&
'    settheory -a one,two,three -b four,two,five,three                   ',&
'    A            :  one   two   three                                   ',&
'    B            :  four  two   five  three                             ',&
'    UNIQUE       :  one   three two   , five  four  three two           ',&
'    UNION        :  five  four  one   three two                         ',&
'    INTERSECT    :  three two                                           ',&
'    SETDIFF      :  one                                                 ',&
'    ISMEMBER     :  0 1 1                                               ',&
'    SETXOR       :  five  four  one                                     ',&
'                                                                        ',&
'    settheory -a 7,23,14,15,9,12,8,24,35 -b 2,5,7,8,14,16,25,35,27 \    ',&
'              -type integer                                             ',&
'    A            :  7 23 14 15 9 12 8 24 35                             ',&
'    B            :  2 5 7 8 14 16 25 35 27                              ',&
'    UNIQUE       :  7 8 9 12 14 15 23 24 35 , 2 5 7 8 14 16 25 27 35    ',&
'    UNION        :  2 5 7 8 9 12 14 15 16 23 24 25 27 35                ',&
'    INTERSECT    :  7 8 14 35                                           ',&
'    SETDIFF      :  9 12 15 23 24                                       ',&
'    ISMEMBER     :  1 0 1 0 0 0 1 0 1                                   ',&
'    SETXOR       :  2 5 9 12 15 16 23 24 25 27                          ',&
'    # or                                                                ',&
'    settheory -a ''7 23 14 15 9 12 8 24 35'' -b ''2 5 7 8 14 16 25 35 27''',&
'    # or                                                                  ',&
'    settheory -a 7:23:14:15:9:12:8:24:35 -b 2:5:7:8:14:16:25:35:27        ',&
'                                                                          ',&
'SEE ALSO                                                                  ',&
'    diff(1),uniq(1),sort(1),comm(1),join(1)                               ',&
'']
version_text=[ CHARACTER(LEN=128) :: &
'PRODUCT:        GPF (General Purpose Fortran) utilities and examples',&
'PROGRAM:        settheory(1f)                                       ',&
'DESCRIPTION:    given to small integer vectors find union, intersection, and setdiff',&
'VERSION:        1.0, 2024-10-04                                                     ',&
'AUTHOR:         John S. Urban                                                       ',&
'LICENSE:        MIT                                                                 ',&
'']
end subroutine setup
end program main
