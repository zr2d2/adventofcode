#!/usr/bin/ruby

strings = Array.new
nice_count = 0
bad_strings = %w(ab cd pq xy)

File.open('day5.txt').each do |string|
 strings << string
end

strings.each do |string|

  nice = false

  repeating_pair = true if /(.{2}).*\1/.match string

  repeated_space = true if /(.).\1/.match string

  nice = repeating_pair && repeated_space

  if nice
    nice_count += 1
    puts string
  end
end
puts "there are #{nice_count} nice strings"
