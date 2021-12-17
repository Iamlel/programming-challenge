module myutils

  !----------------------------------
  ! Using fortran-utils: https://github.com/certik/fortran-utils
  
	use types, only: dp
  
  !----------------------------------
  
	implicit none

	contains 
	
	logical function whitechar(char)
		character, intent(in) :: char
		if (iachar(char) == 32 .or. iachar(char) == 9 .or. char == ",") then
			whitechar = .true.
		else
			whitechar = .false.
		end if
	end function
	
	subroutine loadtxt(filename, d)
		character(len=*), intent(in) :: filename
		real(dp), allocatable, intent(out) :: d(:, :)
		character :: c
		integer :: s, ncol, nrow, ios, i
		logical :: lastwhite
		real(dp) :: r
		
		open(newunit=s, file=filename, status="old")
		
		ncol = 0
		lastwhite = .true.
		
		do
			read(s, '(a)', advance='no', iostat=ios) c
			if (ios /= 0) exit
			if (lastwhite .and. .not. whitechar(c)) ncol = ncol + 1
			lastwhite = whitechar(c)
		end do
		
		rewind(s)
		
		nrow = 0
		do
			read(s, *, iostat=ios) r
			if (ios /= 0) exit
			nrow = nrow + 1
		end do
		
		rewind(s)
		
		allocate(d(nrow, ncol))
		do i = 1, nrow
			read(s, *) d(i, :)
		end do
		close(s)
	end subroutine
end module
