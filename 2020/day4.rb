passports = Array.new
input = Hash.new
eyes = %w(amb blu brn gry grn hzl oth)
valid_number = 0

File.readlines('day4input.txt').each do |line|
  #puts line
  if line.length == 1
    #puts 'empty line'
    passports << input
    input = Hash.new
    next
  end
  
  fields = line.split
  
  fields.each do |field|
    key, value = field.split ':'
    input[key.to_sym] = value
  end
end

passports.each do |passport|
  valid = true
  
  required_fields = %w(byr iyr eyr hgt hcl ecl pid)

  required_fields.each do |field|
    valid = false unless passport.has_key? field.to_sym
  end
  
  next unless valid
  
  valid = false unless 1920 <= passport[:byr].to_i && passport[:byr].to_i <= 2002
  valid = false unless 2010 <= passport[:iyr].to_i && passport[:iyr].to_i <= 2020
  valid = false unless 2020 <= passport[:eyr].to_i && passport[:eyr].to_i <= 2030

  valid = false unless passport[:hcl]=~ /^#[0-9a-f]{6}$/
  valid = false unless passport[:pid]=~ /^\d{9}$/

  valid = false unless eyes.include? passport[:ecl]

  matches = passport[:hgt].match(/^(\d+)(\w*)$/)

  if matches[2].eql? ''
    valid = false
  elsif matches[2].eql? 'cm'
    valid = false unless 150 <= matches[1].to_i && matches[1].to_i <= 193
  elsif matches[2].eql? 'in'
    valid = false unless 59 <= matches[1].to_i && matches[1].to_i <= 76
  else
   puts matches.inspect
   puts "weird height unit #{matches[2]}"
   exit 1
  end  

  valid_number +=1 if valid  
end

puts "#{passports.size} passports, #{valid_number} of which are valid"