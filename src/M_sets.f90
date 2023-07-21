module M_sets
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, M_sets!"
  end subroutine say_hello
end module M_sets
