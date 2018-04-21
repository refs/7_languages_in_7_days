rng = Random.new
puts "take a guess"
number = rng.rand(10)

while true do
  puts number
  guessed = gets.to_i

  if guessed == number then
      puts "nice!"
      break
  else
      puts "make another guess"
  end
end
