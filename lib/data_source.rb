require 'pry'

class Source
  def locate_data(source = "../real_sample_data.txt")
    File.readlines(source)
    # binding.pry
  end
end

# data = Source.new
# data.locate_data
