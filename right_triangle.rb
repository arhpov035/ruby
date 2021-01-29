puts "Введите первую сторону треугольника"
first_side = gets.chomp.to_i

puts "Введите вторую сторону треугольника"
second_side = gets.chomp.to_i

puts "Введите третью сторону треугольника"
third_side = gets.chomp.to_i

if first_side > second_side && first_side > third_side
	hypotenuse = first_side
	cathetus1 = second_side
	cathetus2 = third_side
elsif second_side > third_side
	hypotenuse = second_side
	cathetus1 = first_side
	cathetus2 = third_side
else
	hypotenuse = third_side
	cathetus1 = first_side
	cathetus2 = second_side
end

if first_side == second_side && first_side == third_side
	puts "Треугольник равнобедренный"
elsif hypotenuse == cathetus1**2 + cathetus2**2
	puts 'Треугольник прямоугольный'
else
	puts 'Треугольник НЕ прямоугольный'
end