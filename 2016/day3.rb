#!/usr/bin/ruby

class Triangle
  attr_reader :side1, :side2, :side3, :valid

  def initialize( side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid?
    sides = [@side1, @side2, @side3]

    sides.sort!

    return true if  sides[0] + sides[1] > sides[2]

    return false
  end
end

valid_triangles = Array.new

tries = 2

file = File.open 'day3.txt','r'

file.each_line do |line|
  sides = line.split
  puts "sides: #{sides.inspect}"

  triangle = Triangle.new sides[0], sides[1], sides[2]

  valid_triangles << triangle if triangle.valid?
  puts "Triangle #{sides} is valid? #{triangle.valid?}"

  puts 'calculated triangle'
  tries -= 1

  break if tries == 0
end

puts "There are #{valid_triangles.count} valid triangles"