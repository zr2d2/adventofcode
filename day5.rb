#!/usr/bin/ruby

strings = Array.new
nice_count = 0
bad_strings = %w(ab cd pq xy)

File.open('day5.txt').each do |string|
 strings << string
end

strings.each do |string|
  nice = false

  # three vowels
  three_vowels = true if /(.*[aeiou]){3}/.match string

  # double letter
  double_letter = true if /(.)\1/.match string
  #puts 'double' if nice

  # forbidden substrings
  forbidden_strings = true unless bad_strings.inject(false) { |memo, word| string.include?(word) ? true : memo }

  nice = three_vowels && double_letter && forbidden_strings

  if nice
    nice_count += 1
    puts string
  end
end
puts "there are #{nice_count} nice strings"
