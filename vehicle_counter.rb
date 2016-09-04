require 'pry'
require_relative './lib/distribution'
require_relative './lib/session'
require_relative './lib/count'
require_relative './lib/test'

#
# Distribution
# binding.pry

def run_analysis(bound)
  puts "======================="
  begin
    puts "Please select the following options:"
    puts "Weekly Vechile Counts/Analysis for #{bound}"
    puts "(1) per Hour / (2) per 30 minutes / (3) per 20 minutes / (4) per 15 minutes /"
    puts "(5) in the Morning (6am-12pm) vs. Evening (6pm-12am) / (6) peak hours "
    puts "(7) per hourly speed distribution / (8) per hourly distance between cars"
    puts "(q) Exit"
    input = gets.chomp
    case input
    when "1"
      puts Session.new(bound,60).sort_sections
    when "2"
      puts Session.new(bound,30).sort_sections
    when "3"
      puts Session.new(bound,20).sort_sections
    when "4"
      puts Session.new(bound,15).sort_sections
    when "5"
      puts Count.new(bound).compare_morning_evening
    when "6"
      puts Count.new(bound).determine_peaks
    when "7"
      puts Distribution.new(bound).determine_speed
    when "8"
      puts "from hour? (0 - 23)"
      begin_hour = gets.chomp
      puts "to hour? (0 - 23)"
      end_hour = gets.chomp
      puts Distribution.new(bound).determine_distance_apart(begin_hour.to_i, end_hour.to_i)
    end
  end while input!= "q"
end

puts "Hello! Please pick a bound to be analysed."
puts "1. North Bound"
puts "2. South Bound"
choice_bound = gets.chomp
puts "======================="
if choice_bound.downcase == "north bound" || choice_bound == "1"
  puts "Analysing North Bound :"
  run_analysis("nb")
elsif choice_bound.downcase == "south bound" || choice_bound == "2"
  puts "Analysing South Bound :"
  run_analysis("sb")
else
  puts "invalid choice - try again"
end
