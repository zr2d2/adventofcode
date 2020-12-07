def decode(encoded, range)
  return range.first if encoded.size.eql? 0
  
  letter = encoded.shift
  
  if letter.eql?('F') || letter.eql?('L')
    #puts "taking front half of #{range.inspect}"
    new_range = range.slice(0, range.size/2)
  else
    #puts "taking back half of #{range.inspect}"
    new_range = range.slice(range.size/2,range.size/2)
  end
  
  #puts "new range is:#{new_range.inspect}"
  
  row = decode(encoded, new_range)
end

highest = 0
ids = []

File.readlines('day5input.txt').each do |line|
  rows    = (0..127).to_a
  columns = (0..7).to_a

  encodedrow    = line[0..6]
  encodedcolumn = line[7..9]
  
  row = decode(encodedrow.chars, rows)
  
  column = decode(encodedcolumn.chars, columns)
  
  id = row*8+column
  
  ids << id
  highest = id if id > highest
  
  #puts "row: #{row}, column: #{column}, id: #{id}"
end

seats = (55..906).to_a

ids.each do |id|
  seats.delete id
end

puts seats