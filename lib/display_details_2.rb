require 'pry'
require_relative 'sort_by_day'

class Display
  attr_reader :bound_subject

  def initialize(bound = "nb")
    if bound == "nb"
      bound = NorthBound.new.isolate_NB_vehicles_A
    elsif bound == "sb"
      bound = SorthBound.new.isolate_SB_vehicles_B
   end
    @bound_subject = Sorting.new.into_hashes(bound)
    # puts bound_subject
  end

  def by_time_section
    # if 60 % minutes != 0 # display sections must be equally portioned 10, 15, 20, 30, 60
    #   puts "ERROR ERROR!" #learn how to raise error here
    # else
      num_days = bound_subject[bound_subject.length][0] #.last night working
      # num_days = 5
      minutes = 30
      sections = 60 / minutes
      bound_stored_daily = {}

      (1..1).each do |day|
        puts "Evaluating Day: #{day}"
        stored_by_sections = []
        stored_by_day = []
        daily_subject_hash = bound_subject.select{|k, v| v[0] == day} #filtering - process one day at a time


        (1..5).each do |hour|
          puts "HOUR : #{hour}"
          lower_limit = 0
          upper_limit = minutes - 1

          sections.times do |times|
            daily_subject_hash.each do |key,value|
                if value[1].hour == hour && value[1].min.between?(lower_limit,upper_limit)
                  puts "hey key #{key} with #{value[1].hour}:#{value[1].min} belonging to #{value[1].hour}:#{lower_limit}"
                  # stored_by_sections << day << key << "#{value[1].hour}:#{value[1].min}" << "#{value[1].hour}:#{lower_limit}"
                end
                # stored_by_day << stored_by_sections
                lower_limit += minutes
                upper_limit += minutes
            end
            # binding.pry


          end

        end
        # stored_by_day[day] = stored_by_sections.count
      end

    # end
  end

end

Display.new.by_time_section
