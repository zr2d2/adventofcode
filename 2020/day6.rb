forms = []
input = []
number = 0

File.readlines('day6testinput.txt').each do |line|
  #puts line
  if line.length == 1
    #puts 'empty line'
    puts input.inspect
    forms << input.sort
    input = []
    next
  end
  
  answers = line.match(/\w*/)[0].chars
  puts "answers: #{answers}"
  puts "input: #{input}"
  
  if input.size == 0
    input = answers
  else
    input = input.intersection answers
  end
  
  #puts input.inspect
end

forms.each_with_index do |form, i|
  puts "group #{i} has #{form.size} answers"
  number += form.size
end

puts "#{number} total unique quesstions"