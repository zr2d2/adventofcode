#! /home/zach/.rvm/rubies/ruby-2.3.1/bin/ruby
input = File.new 'day9.txt', 'r'

garbage = /<[^>]*!.[^>]*>/

num = 0

input.each_line do |line|
  line.sub! garbage, ''

  depth = 0

  line.each_char do |char|

    case char
    when '{'
      depth += 1
      puts 'depth + 1'
      puts "depth = #{depth}"
    when '}'
      num += depth
      puts "num + #{depth}"

      depth -= 1
    end
  end
end

puts num