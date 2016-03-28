def count_bits(num)
  counts = (0..num).to_a
  counts.map! { |i| i%2 + counts[i/2] }
end

p count_bits(5)
