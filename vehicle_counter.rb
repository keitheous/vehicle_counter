require './lib/displays'

def analyse_bound(bound)
  bound == "nb" ? (puts "North Bound Analysis") : (puts "South Bound Analysis")
  puts Displays.new(bound).sort_sections

end

puts "Hello! Please pick a bound to be analysed."
puts "NB - for North Bound"
puts "SB - for South Bound"
input = gets.chomp
input.downcase == "nb" ? analyse_bound("nb") : analyse_bound("sb")
