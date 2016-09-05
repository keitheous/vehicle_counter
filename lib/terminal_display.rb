require_relative 'session'
require_relative 'count'

class Display

  attr_reader :object_to_display
  def initialize(data)
    @object_to_display = data
  end

  def in_terminal
    object_to_display.each do |day, hourly_data|
      puts "Day number #{day}:"
      puts hourly_data
    end
  end
end

# Thought Process:
# ----------------
# Necessary to display all processed data in a universal and simple by-DAY : format
