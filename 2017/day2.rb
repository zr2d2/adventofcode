#! /home/zach/.rvm/rubies/ruby-2.3.1/bin/ruby
input = File.new 'day2.txt', 'r'

checksum = 0

input.each_line do |line|
  nums = line.scan(/\w+/).map{|w|w.to_i}.sort
  #puts "nums: #{nums.inspect}"

  nums.each_with_index do |x, i|
    (i+1..nums.length-1).each do |y|
      if nums[y] % x == 0
        #puts "#{x} #{nums[y]}"

        delta = nums[y] / x
        
        checksum += delta
        
        break
      end 
    end
  end
end

puts "checksum #{checksum}"
