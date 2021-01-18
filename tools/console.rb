require_relative '../config/environment.rb'
require 'date'
def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("Numerology", "Austin", 1999, "We eat babies")
cult2 = Cult.new("Scientology", "Los Angeles", 1986, "Actors baby")
cult3 = Cult.new("Mormon", "Salt Lake City", 1884, "Wives for days")
cult4 = Cult.new("Mon", "Salt Lake City", 1889, "for days")


follower1 = Follower.new("Tom", 47, "I can act")
follower2 = Follower.new("John", 36, "Have big face")
follower3 = Follower.new("Dorothy", 17, "Yellow bricks")
follower4 = Follower.new("Bill", 36, "Love cults")

cult1.recruit_follower(follower1)
cult1.recruit_follower(follower2)
cult2.recruit_follower(follower2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits