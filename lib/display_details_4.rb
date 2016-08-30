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
    @minutes = 20
    @sections = 60 / minutes
  end

  def by_time_section
    results_stored_daily = {}
    stored_hourly = {}

    (1..num_days).each do |day|
      puts "evaluating day #{day}"
      # processing bound_subject one day at a time out of 5 days
      daily_subject_hash = bound_subject.select{|daily_key, daily_value| daily_value[0] == day}

      # do hourly first
      (00..02).each do |hour| #assess every hourly
        puts "evaluating hour #{hour}"

        lower_limit = 0 #resets every hour, the clock starts at 00 minutes - lower sectioning
        upper_limit = minutes - 1 #upper sectioning
        stored_hourly = daily_subject_hash.select{|hourly_key, hourly_value| hourly_value[1].hour == hour}

        (1..sections).each do |section| #split the evaluation into the sections

          stored_hourly.each do |key, value| #now assess every minutely

            if value[1].hour == hour && value[1].min.between?(lower_limit,upper_limit)
              puts "#{key} -> #{value[1].hour}:#{value[1].min} falls in  #{value[1].hour}:#{lower_limit}"
            end #end of if stament

          end #end of minutely iteration

          lower_limit += minutes
          upper_limit += minutes
          #increase the limits based on sections
        end #end of sections iteration

      end #end for hourly iteration

    end #end for daily iteration

  end #end for method

end #end of classs

Display.new.by_time_section
