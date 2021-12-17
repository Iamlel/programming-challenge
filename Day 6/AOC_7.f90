module adventOfCode
	!----------------------------------
	! Using fortran-utils: https://github.com/certik/fortran-utils
	
	use sorting, only: sort
	use myutils, only: loadtxt ! My version of fortran utils. Included in this github
	use types, only: dp
	!----------------------------------
	implicit none
	
	integer :: total, num, num2, i, j
	integer, allocatable :: list(:)
	real(dp), allocatable :: d(:, :)

	contains 
	
	subroutine partone
		call loadtxt("puzzle.txt", d)
		num = size(d)
		allocate(list(num))
		
		list(1:num) = int(d(1, 1:num))
		
		call sort(list)
		
		num2 = list(floor(num / 2 + 0.5))
		total = 0
		do i = 1, num
			total = total + abs(list(i) - num2)
		end do
		
		print *, total
	end subroutine

	subroutine parttwo
		call loadtxt("puzzle.txt", d)
		num = size(d)
		allocate(list(num))
		
		list(1:num) = int(d(1, 1:num))
		
		num2 = ceiling((real(sum(list) / num)))
		do i = 1, num
			j = abs(list(i) - num2)
			total = total + ((j ** 2 + j) / 2)
		end do
		
		print *, total
	end subroutine
end module
