require 'pry'

class DataSource
  def locate(source = "./data/real_sample_data.txt")
    File.readlines(source)
  end
end

# Thought Process:
# ----------------
# For this coding test, I decided to put this in a class instead
# of a bin/main.rb because this is a small scale program that doesn't
# need a bin folder. Going with "a class should only have one purpose",
# the purpose of this class is to mainly locate the source in the data
# folder. In the future when running other datasets, only line 4 needs
# changing. This class leads to bound.rb
