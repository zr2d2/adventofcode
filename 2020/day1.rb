numbers = []

File.readlines('day1input.txt').each do |line|
  numbers << line.to_i
end

numbers.each_index do |index1|
 nums = numbers.slice index1 + 1, numbers.length
 
 nums.each_index do |index2|
  oposite = 2020 - numbers[index1] - nums[index2] 

  if numbers.include? oposite
    puts "number sum is 2020. number product is #{numbers[index1] * nums[index2] * oposite}"
  end
 end
end