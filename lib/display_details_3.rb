require 'pry'
require_relative 'sort_by_day'

class Display
  attr_reader :bound_subject, :num_days, :minutes, :sections

  def initialize(bound = "nb") #, minutes = "60"
    if bound == "nb"
      bound = NorthBound.new.isolate_NB_vehicles_A
    elsif bound == "sb"
      bound = SorthBound.new.isolate_SB_vehicles_B
   end
    @bound_subject = Sorting.new.into_hashes(bound)
    # @num_days = bound_subject[bound_subject.length][0]
    # puts bound_subject
    @num_days = 1
    @minutes = 30
    @sections = 60 / minutes
  end

  def by_time_section
    results_stored_daily = {}
    stored_hourly = {}

    (1..num_days).each do |day|
      puts "evaluating day #{day}"
      # processing bound_subject one day at a time out of 5 days
      daily_subject_hash = bound_subject.select{|k, v| v[0] == day}
      lower_limit = 0 #everyday, the clock starts at 00 minutes, sectioning limit
      upper_limit = minutes - 1 # initial sectioning limit for display, increment later
      # do hourly first
      (00..01).each do |hour|
        puts "evaluating hour #{hour}"
        stored_hourly = daily_subject_hash.select{|k, v| v[1].hour == hour}
        stored_hourly.each do |key,value|

          if value[1].min.between?(lower_limit,upper_limit)
            puts "#{key} -> #{value[1].hour}:#{value[1].min} belongs to #{value[1].hour}:#{lower_limit} "
          end #end for if statement

        end #end for minutely iteration
      end #end for hourly iteration
      binding.pry
    end #end for daily iteration

  end #end for method

end

Display.new.by_time_section
