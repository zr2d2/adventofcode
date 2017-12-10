#! /home/zach/.rvm/rubies/ruby-2.3.1/bin/ruby

direction = 0
x = 1
y = 0

input = 347991
values = {"0_0"=>1}

(2..input).each do |i|
  # place number
  number = 0

  number += values["#{x-1}_#{y}"]   if values.has_key? "#{x-1}_#{y}"
  number += values["#{x-1}_#{y-1}"] if values.has_key? "#{x-1}_#{y-1}"
  number += values["#{x-1}_#{y+1}"] if values.has_key? "#{x-1}_#{y+1}"
  number += values["#{x}_#{y-1}"]   if values.has_key? "#{x}_#{y-1}"
  number += values["#{x}_#{y+1}"]   if values.has_key? "#{x}_#{y+1}"
  number += values["#{x+1}_#{y}"]   if values.has_key? "#{x+1}_#{y}"
  number += values["#{x+1}_#{y-1}"] if values.has_key? "#{x+1}_#{y-1}"
  number += values["#{x+1}_#{y+1}"] if values.has_key? "#{x+1}_#{y+1}"

  if number > input
    puts number

    exit
  end

  values["#{x}_#{y}"] = number

  #decide to turn
  check_x = x
  check_y = y

  next_x = x
  next_y = y

  case direction%4
  when 0
    check_y += 1

    #puts "checking #{check_x}_#{check_y}"

    if values.has_key? "#{check_x}_#{check_y}"
      next_x += 1
    else
      next_y = check_y

      direction += 1
    end
  when 1
    check_x -= 1

    #puts "checking #{check_x}_#{check_y}"

    if values.has_key? "#{check_x}_#{check_y}"
      next_y += 1
    else
      next_x = check_x

      direction += 1
    end
  when 2
    check_y -= 1

    #puts "checking #{check_x}_#{check_y}"

    if values.has_key? "#{check_x}_#{check_y}"
      next_x -= 1
    else
      next_y = check_y

      direction += 1
    end
  when 3
    check_x += 1

    #puts "checking #{check_x}_#{check_y}"

    if values.has_key? "#{check_x}_#{check_y}"
      next_y -= 1
    else
      next_x = check_x

      direction += 1
    end
  end

  #move
  x = next_x
  y = next_y
end