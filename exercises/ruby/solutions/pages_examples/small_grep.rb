def grep(term) 
  line_number = 0
  IO.foreach("src.dat") do |line|
      if /(#{term})/o.match(line) then
          puts "found term: #{term} at line: #{line_number}"
      end
      line_number += 1
  end
end

grep("dolor")
