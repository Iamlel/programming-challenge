module PartOne
	implicit none
	integer :: input(16) = [72,18,38,91,2,0,1,5,6,7,8,1,2,3,4,991]
	integer :: num = size(input)
  
	contains

	recursive subroutine median(j_)
		integer :: list(num - 1), list2(num - 1)
		!integer, allocatable :: list(2)
		integer, optional, intent(in) :: j_
		integer :: i, j, med, big, small, equal, posi
		
		j = floor((real(num) / 2))
		if ((present(j_))) j = j_
		
		med = input(j)
		big = 0 
		small = 0
		equal = 0
		
		do i = 1, num
			if (input(i) > med) then
				big = big + 1
				list(big) = input(i)
			else if (input(i) < med) then
				small = small + 1
				list2(small) = input(i)
			else if (input(i) == med) then
				equal = equal + 1
			end if
		end do
		
		posi = small + ceiling(real(equal) / 2)
		if (j == posi) then
			print *, med
		else if (j < posi) then
			input = list2
			num = small
			call median(j)
		else if (j > posi) then
			input = list
			num = big
			call median(j - posi)
		end if
	end subroutine
end module PartOne

program main
	use PartOne
	implicit none
	call median()
end program main
