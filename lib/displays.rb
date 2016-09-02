require 'pry'
require_relative 'sort'

class Displays
  attr_reader :bound, :num_days, :minutes, :sections

  def initialize(which_bound, minute_user_input)

    valid_time_input?(minute_user_input)

    if which_bound == "nb"
      @bound = Sort.new("nb").into_pairs_by_day
    elsif which_bound == "sb"
      @bound = Sort.new("sb").into_pairs_by_day
    end
    binding.pry
    @num_days = bound[bound.length][0]
    # @num_days can be adjustable if this was scalable - choose how many days to display
    @minutes = minute_user_input
    @sections = 60 / minute_user_input
  end

  def by_time_section
    results_stored_daily = {} #the ultimate result of this class
    # stored_hourly = {}

    (1..num_days).each do |day|
      # puts "evaluating day #{day}"
      # processing bound_subject one day at a time out of 5 days
      daily_subject_hash = bound.select{|daily_key, daily_value| daily_value[0] == day}

      hourly_results = {}
      # do hourly first
      (00..23).each do |hour| #assess every hourly between 00 to 24 hour
        # puts "evaluating hour #{hour}"

        sectionly_frequency = []
        lower_limit = 0 #resets every hour, the clock starts at 00 minutes - lower sectioning
        upper_limit = minutes - 1 #upper sectioning
        stored_hourly = daily_subject_hash.select{|hourly_key, hourly_value| hourly_value[1].hour == hour}

        (01..sections).each do |section| #split the evaluation into the sections

          stored_hourly.each do |key, value| #now assess every minutely

            if value[1].hour == hour && value[1].min.between?(lower_limit,upper_limit)
              sectionly_frequency << "#{key} -> #{value[1].hour}:#{value[1].min} falls in  #{value[1].hour}:#{lower_limit}"
            end #end of if stament

          end #end of minutely iteration
          #store the count and store individually
          # binding.pry
          hourly_results["#{hour}:#{lower_limit}"] = sectionly_frequency.count
          lower_limit += minutes    #increase the limits based on sections
          upper_limit += minutes


        end #end of sections iteration

      end #end for hourly iteration

      results_stored_daily[day] = hourly_results #temporary memory

    end #end for daily iteration

    results_stored_daily #returned result in form of HASH of section counts in DAYS
    # binding.pry
  end #end for method

  private

  def valid_time_input?(user_input)
    raise 'error' if (60 % user_input != 0 || user_input < 0)
  end
  # end
end #end of classs

Displays.new("nb",7).by_time_section
# Display.new("sb",15).by_time_section
# Display.new("sb",30).by_time_section
# Display.new("sb",-6).by_time_section
# Display.new("sb",7).by_time_section
