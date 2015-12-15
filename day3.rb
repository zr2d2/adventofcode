#!/usr/bin/ruby

@houses = 1

moves = ''
moves0 = ''
moves1 = ''

def count_houses(moves)
  lat  = 0
  long = 0
  visited = Hash.new
  visited[0] = [0]

  moves.chars.each do |move|
    case move
      when '^'
        lat += 1
      when 'v'
        lat -= 1
      when '>'
        # puts 'hurray!'
        long += 1
      when '<'
        long -= 1
      else
        puts "invalid move: #{move}"
    end

    lats = visited[lat]
    lats ||= []

    unless lats.include? long
      lats << long
      visited[lat] = lats
      @houses += 1
    end
  end
end

File.open('day3.txt').each_char do |move|
 moves << move
end

moves.chars.each_with_index do |x, int|
  eval("moves#{int%2}") << x
end

#puts moves0
count_houses moves0
lat = long = 0
count_houses moves1

puts @houses
