puts "Введите основание треугольника"
a = gets.chomp.to_i

puts "Введите высоту треугольника"
h = gets.chomp.to_i

if a == 0 || h == 0
	puts "Введите правильное значение Основания или высоты"
else
	area = 0.5*a*h
	puts "Площадь треугольника равна #{area}"
end