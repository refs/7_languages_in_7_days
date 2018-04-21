require_relative "acts_as_csv_module"

csv = RubyCsv.new
csv.each {|r| puts r.firstname}
