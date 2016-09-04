require 'pry'
require_relative 'group'

class Session
  attr_reader :bound, :num_days, :minutes, :sections

  def initialize(which_bound ="nb", minute_user_input = 60)
    valid_time_input?(minute_user_input)
    @bound = which_bound?(which_bound)
    @minutes = minute_user_input
    @sections = 60 / minute_user_input
    @num_days = bound[bound.length][0]
  end

  def sort_sections
    sectioned_daily_results = {}
    (1..num_days).each do |day|
      daily_subject_hash = bound.select{|_, daily_value| daily_value[0] == day}
      # filter by day, 1 to 5, process one day a time
      sectioned_results = {}
      (00..23).each do |hour| #filer by hour, process hourly between 0 to 24
        frequency_arr = []
        lower_limit = 0 #resets to every hour - lower sectioning
        upper_limit = minutes- 1 #upper sectioning
        by_the_hour = daily_subject_hash.select{|_, hourly_values| hourly_values[1].hour == hour}
        (01..sections).each do |section| #split into the sections, process every minutely
          by_the_hour.each { |index, values| frequency_arr << index if values[1].hour == hour && values[1].min.between?(lower_limit,upper_limit) }
          sectioned_results["#{hour}:#{lower_limit}"] = frequency_arr.count
          lower_limit += minutes
          upper_limit += minutes  #increase the limits on sections
        end
      end
      sectioned_daily_results[day] = sectioned_results
    end
    sectioned_daily_results
  end

  private
  def which_bound?(bound)
    bound == "nb" ? Group.new("nb").into_pairs_by_day : Group.new("sb").into_pairs_by_day
  end
  def valid_time_input?(user_input)
    raise 'error' if (60 % user_input != 0 || user_input < 0)
  end
end

# Thought Process:
# ----------------
# Flowing in from group.rb, session.rb would then process the hashes into sections
# based on the requirements (display every 60min, 30min, 20min, 15min). Instead of
# a massive IF ELSE statement for each of these requirements, the sort_sections
# method breaks the time stream up into sections with upper and lower limits
# 60 minutes display has 1 section with 00 as lower and 59 as upper limit
# 20 minutes display has 3 equal sections, the limits are 00-19, 20-39 and 40-59
# 15 minutes display has 4 equal sections, limits 00-14, 15-29, 30-44 and 45-59
#
# This is achieved firstly by passing in the minutes display and bounds (nb or sb).
# Private method valid_time_input? checks if the input is divisible to 60. If so,
# the number is then assiged to local variable @minute and is used to break an hour
# up into sections (Line 11).
#
# One section begins with lower limit = 0 and upper limit = @minute. If there are
# more than 1 section, lower limit and upper limit increment based on @minute per
# section (line 29 and 30 based on Line 26).
# The data is first filtered down to be process one day at a time (line 17 & 18).
# Each of this step is filtered futher down to hour (Line 23 & 25).
# In each of these sections, (Line 27 & 28) the hour and minutes are checked. If
# they fall within in between?(lower,upper) limit, they are pushed into frequency_arr
#
# Line 28 stores these frequency_arr.count based on variable days in the end result.
