require 'CSV'

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class CSV
    class Row
        def method_missing name, *args
          self[name.to_s]
        end
    end
end

class RubyCsv 
  include ActsAsCsv
  acts_as_csv

  def each
      @csv_contents.each do |row|
          yield CSV::Row.new(@headers[0].split(","), row[0].split(","), true)
      end
  end
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

