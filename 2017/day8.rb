#! /home/zach/.rvm/rubies/ruby-2.3.1/bin/ruby
input = File.new 'day8.txt', 'r'

registers = Hash.new(0)

highest = 0

input.each_line do |line|
  parts = line.split

  register   = parts[0]
  direction  = parts[1]
  amount     = parts[2].to_i
  comparison = parts[4]
  operand    = parts[5]
  number     = parts[6].to_i 

  condition = false

  case operand
  when '!='
    condition = true if registers[comparison] != number
  when '>'
    condition = true if registers[comparison] > number
  when '>='
    condition = true if registers[comparison] >= number
  when '=='
    condition = true if registers[comparison] == number
  when '<='
    condition = true if registers[comparison] <= number
  when '<'
    condition = true if registers[comparison] < number
  else
    puts "no check for #{operand}"
  end

  if condition == true
    if direction == 'inc'
      registers[register] += amount
    else
      registers[register] -= amount
    end

    highest = registers[register] if registers[register] > highest
  end
end

largest = registers.values.sort.last
puts "largest register is #{largest}"
puts "highest number stored is #{highest}"