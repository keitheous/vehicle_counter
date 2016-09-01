require 'pry'

class DataSource
  def locate(source = "./data/real_sample_data.txt")
    File.readlines(source)
  end
end
