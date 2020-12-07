path = Array.new

number = 1

File.readlines('day3input.txt').each do |line|
  path << line
end

slopes = [[1,1],[3,1],[5,1],[7,1],[1,2]]
#slopes = [[7,1]]

slopes.each do |arr|
  trees = 0

  right, down = arr
  
  path.each_with_index do |line, i|
    next if (i+1)%down == 0 && down > 1
    #puts i

    long = (i/down*right)%(line.length)#+i/line.length

    #puts "line:#{1+i}, col:#{1+long}"

    if line[long].eql? '#' then
      trees += 1 
      #puts "tree at line #{i+1}, col #{long+1}"
    end
  end
  
  puts "slope #{right}, #{down} has #{trees} trees"
  
  if (right == 3 && down == 1 && trees != 195)
    puts "The defense is wrong"
    exit
  end
  number = number * trees
end

wrong = %w(3692052000 861750400 732487840)

if wrong.include? number.to_s
  puts "The defense is wrong"
else
  puts "overall there are #{number} trees multiplied"
end