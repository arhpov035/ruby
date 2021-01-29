puts "Как тебя зовут"
name = gets.chomp

puts "Какой твой рост"
height = gets.chomp

ideal_height = height.to_i - 110

if ideal_height < 0
  puts 'Ваш вес уже оптимальный'
else
  puts "Здравствуйте #{name}, Ваш идеальный вес = #{ideal_height}"
end