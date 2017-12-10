#! /home/zach/.rvm/rubies/ruby-2.3.1/bin/ruby
input = File.new 'day4.txt', 'r'

valid = 0

input.each_line do |line|
  words = line.split.map{ |x| x.chars.sort.join }

  valid += 1 if words == words.uniq
end

puts "#{valid} valid passcodes"