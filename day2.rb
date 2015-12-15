#!/usr/bin/ruby
sa = 0
ribbon = 0

File.open('day2.txt').each do |box|
  l, w, d = box.split('x').map{ |n| n.to_i }
  dimensions = box.split('x').map{ |n| n.to_i }
  new_wrap = []
  new_wrap << l*w
  new_wrap << l*d
  new_wrap << w*d
  new_wrap.map { |x| sa += 2*x}
  sa += new_wrap.min

  #first add the bow, equal to the volume
  bow = l * w * d
  puts "bow is: #{bow}"
  #then calculate the shortest path arround
  dimensions.sort! { |x,y| y <=> x }.shift
  puts dimensions.inspect
  ribbon += dimensions.reduce(0) { |memo, obj| puts "add #{obj*2}"; memo + obj * 2}
  puts "ribbon is #{ribbon}"
  ribbon += bow
end
puts "total paper needed: #{sa}"
puts "total ribbon needed: #{ribbon}"
