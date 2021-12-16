module partone
	!----------------------------------
	! Using fortran-utils: https://github.com/certik/fortran-utils
	
	use sorting, only: sort
	use utils, only: loadtxt
	use types, only: dp
	!----------------------------------
	implicit none
	
	integer :: total, num, med, i, j
	integer, allocatable :: list(:)
	real(dp), allocatable :: d(:, :)

	contains 
	
	subroutine startup
		call loadtxt("puzzle.txt", d)
		num = size(d)
		allocate(list(num))
		
		list(1:num) = int(d(1, 1:num))
		
		call sort(list)
		
		med = list(floor((num / 2 + 0.5)))
		total = 0
		do i = 1, num
			total = total + abs(list(i) - med)
		end do
		
		print *, total
	end subroutine
end module
