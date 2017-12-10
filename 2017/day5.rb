#! /home/zach/.rvm/rubies/ruby-2.3.1/bin/ruby
input = File.new 'day5.txt', 'r'

jumps = []

input.each_line{ |line| jumps << line }

i = 0

moves = 0

while i < jumps.length and i >= 0
  jump_to = i + jumps[i].to_i

  if jumps[i].to_i >= 3
    jumps[i] = jumps[i].to_i - 1
  else
    jumps[i] = jumps[i].to_i + 1
  end

  i = jump_to

  moves += 1
end

puts "it took #{moves} moves"