# require 'pry'
# require_relative 'lib/times'
require_relative 'lib/displays'
# require_relative 'lib/test'
# require_relative 'lib/test'
a = Displays.new("nb",60)
binding.pry
#
# def run_analysis(bound)
#   begin
#     puts "Please select the following options:"
#     puts "1. Vehicle Count per Hour"
#     puts "2. Vehicle Count per 30 minutes"
#     puts "3. Vehicle Count per 20 minutes"
#     puts "4. Vehicle Count per 15 minutes"
#     input = gets.chomp
#     case input
#     when "1"
#       a = Displays.new(bound,"60").sort_sections
#       puts a.size
#     when "2"
#       puts Displays.new(bound,"30").sort_sections
#     when "3"
#       puts Displays.new(bound,"20").sort_sections
#     when "4"
#       puts Displays.new(bound,"15").sort_sections
#     else
#       "invalid choice"
#     end
#   end while input!="q"
# end
#
# puts "Hello! Please pick a bound to be analysed."
# puts "1. North Bound"
# puts "2. South Bound"
# choice_bound = gets.chomp
# if choice_bound.downcase == "north bound" || choice_bound == "1"
#   puts "Analysing North Bound :"
#   run_analysis("nb")
# elsif choice_bound.downcase == "south bound" || choice_bound == "2"
#   puts "Analysing South Bound :"
#   run_analysis("sb")
# else
#   "invalid choice - try again"
# end
