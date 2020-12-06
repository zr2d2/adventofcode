passwords = []

valid_passwords = 0

File.readlines('day2input.txt').each do |line|
  range, letter, password = line.split
  
  letter = letter[0]
  
  first, second = range.split '-'

  first  = first.to_i - 1
  second = second.to_i - 1
  
  if [password[first], password[second]].include? letter
    valid_passwords += 1 unless password[first].eql? password[second]
  end
end

puts "valid_passwords is #{valid_passwords}"