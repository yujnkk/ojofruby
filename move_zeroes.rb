def move_zeroes(nums)
    zero_count = nums.count(0)
    nums.delete(0)
    zero_count.times{ nums << 0 }
end

