#! /home/zach/.rvm/rubies/ruby-2.3.1/bin/ruby
registers = [10, 3, 15, 10, 5, 15, 5, 15, 9, 2, 5, 8, 5, 2, 3, 6]
#registers = [0, 2, 7, 0]

configurations = []

seen = []

iterations = 0

loop_end = 0

100000.times do |l|
  biggest = 0

  iterations += 1

  #puts registers.inspect

  (0...registers.size).each do |i|
    biggest = i if registers[i] > registers[biggest]
  end

  #puts biggest

  redistribute = registers[biggest]

  registers[biggest] = 0

  redistribute.times do |i|
    id = (1 + i + biggest) % registers.size

    #puts "id = #{id}"
    #puts "register[id] = #{registers[id]}"
    registers[id] += 1
    #registers[id] = n
    #puts "register[id] = #{registers[id]}"
  end

  seen << registers.join

  if seen != seen.uniq
    loop_end = registers.join

    puts "it takes #{iterations} iterations"

    break
  end

  #puts registers.inspect
end
seen.size.times do |i|
  if seen[i] == loop_end
    puts "the loop is #{seen.size-i-1} long"
    break
  end
end

if seen == seen.uniq
  puts "it takes more than #{iterations} iterations"
end