n, k  = gets.chomp.split(" ").to_i

puts [8, 1, 7, 3, 9].each_slice((n/k.to_f).ceil).map { |x| x.reduce(&:+) }.max



