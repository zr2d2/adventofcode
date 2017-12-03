#! /home/zach/.rvm/rubies/ruby-2.3.1/bin/ruby
input = File.new 'day1.txt', 'r'

input.each_line do |line|
  total = 0
  line.delete! "\n"

  (0..line.length-1).each do |i|
    character = line[i]

    comparison = (i + line.length/2)%line.length

    next_character = line[comparison]

    if character == next_character
      total += character.to_i
    end
  end

  puts "#{line} = #{total}"
end
