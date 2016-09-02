require './lib/displays'
require './lib/times'

def analyse_bound(bound)
  bound == "nb" ? (puts "Analysing North Bound") : (puts "Analysing South Bound")
  until

end

puts "Hello! Please pick a bound to be analysed."
puts "1. North Bound"
puts "2. South Bound"
choice_bound = gets.chomp

if choice_bound.downcase == "north bound" || choice_bound == "1"
  analyse_bound("nb")
elsif choice_bound.downcase == "south bound" || choice_bound == "2"
  analyse_bound("sb")
else
  puts "invalid choice - try again"
end
