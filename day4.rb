#!/usr/bin/ruby
require 'digest'

secret = 'iwrupvqb'
(0..100000000).each do |number|

  message = "#{secret}#{number}"

  md5 = Digest::MD5.new
  md5.update message

  if /^0{6}/.match md5.hexdigest
    puts number
    break
  end
end
