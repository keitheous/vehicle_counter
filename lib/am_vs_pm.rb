require 'pry'
require_relative 'display_details.rb'

  #assuming morning 6am - 12pm and evening 6pm - 12am. Practical reason. How's the traffic heading to and coming home from work. No valid point to compare AM(morning) = 12am - 12pm and PM(evening) = 6pm - 12am

class Compare
  attr_reader :weekly_record

  def initialize(bound = "sb")
    if bound == "nb"
      @weekly_record = Display.new("nb").by_time_section
    elsif bound == "sb"
      @weekly_record = Display.new("sb").by_time_section
    end
    # binding.pry
  end

  def between_morning_and_evening
    #number of days depends on the size of the evaluated data
    num_days = weekly_record.count
    daily_comparision_score = {}
    morning_vehicle_count = 0
    evening_vehicle_count = 0

    #lets process one day at a time shall we? store in per_day_subject for processing
    (1..num_days).each do |day|
      per_day_subject = weekly_record.select{|day_of_the_week, data| day_of_the_week == day}

      #run between 6am(HOUR 06) -> 12pm(HOUR 12) and 6pm(HOUR 18) -> 12am(HOUR 23.59)
      per_day_subject.each do |key, value|
        #doesnt work
        # if value.between?("6:0","12:0")
        #   morning_vehicle_count += value["#{hour}:0"]
        # elsif value.between?("18:0","24:0")
        #   evening_vehicle_count += value["#{hour}:0"]
        # end

        (6...12).each do |hour|
          # puts value["#{hour}:0"]
          morning_vehicle_count += value["#{hour}:0"]
        end #end of 6am to 12pm iteration

        (18..23).each do |hour|
          # puts value["#{hour}:0"]
          evening_vehicle_count += value["#{hour}:0"]
        end #end of 6pm to 12am iteration

        #store by day
        daily_comparision_score[key] = {"morning"=> morning_vehicle_count , "evening" => evening_vehicle_count }
      end
      # daily_comparision_score[day] = {"morning"=> morning_vehicle_count , "evening" => evening_vehicle_count }

    end #end of day iteration

    puts daily_comparision_score
  end #end of method

end #end of class

Compare.new.between_morning_and_evening
