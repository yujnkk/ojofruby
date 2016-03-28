def single_number(nums)
 	nums = nums.sort
	nums.each do |i|
		if nums[2*i]!=nums[2*i+1] 
			then @x=2*i
		end
	end
	nums[@x]
end

p single_number([1,1,2,2,3])
