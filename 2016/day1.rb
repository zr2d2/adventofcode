#! /home/zach/.rvm/rubies/ruby-2.3.1/bin/ruby
moves      = Array.new
visited    = Array.new
directions = Hash.new 0

blocks = 0

limit = 10

facing = 0

input = File.new 'day1.txt', 'r'

input.each_line do |line|
  moves.concat line.split(', ')
end
puts "there are #{moves.count} moves"

moves.each_with_index do |move, i|
  direction, *magnitude = move.chars

  magnitude = magnitude.join.to_i

  case direction
  when 'R'
   facing += 1
  when 'L'
   facing -= 1
  else
    puts "not a direction #{direction}"
  end

  directions[facing.modulo(4)] += magnitude

  coordinates = [directions[0] - directions[2], directions[1] - directions[3]]

  if visited.include? coordinates
    puts "visited #{coordinates} before, after #{i} moves"

    break
  end

  visited << coordinates
  puts "visited #{visited.inspect}"

  limit -= 1
  break if limit == 0
end

blocks = (directions[0] - directions[2]).abs + (directions[1] - directions[3]).abs

puts "HQ is #{blocks} blocks away"