#! /home/zach/.rvm/rubies/ruby-2.3.1/bin/ruby
input = File.new 'day7.txt', 'r'

roots = []

children = []

input.each_line do |line|
  parts = line.split '->'

  roots << parts[0].split.first

  subnodes = parts[1].split(',').map{|x|x.strip!} if parts[1]

  subnodes.each do |subnode|
    if roots.include? subnode
      roots.delete subnode
    else
      children << subnode
    end
  end if subnodes
end

children.each do |node|
  roots.delete node
end

puts roots