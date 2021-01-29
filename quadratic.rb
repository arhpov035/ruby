puts "Введите значение A"
a = gets.chomp.to_f

puts "Введите значение B"
b = gets.chomp.to_f

puts "Введите значение C"
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d > 0
	x1 = ( -b + Math.sqrt(d) ) / 2 * a
	x2 = ( -b - Math.sqrt(d) ) / 2 * a
	puts "Корень x1 = #{x1}, Корень x2 = #{x2}"
elsif d == 0
	x1 = -b / 2 * a
	puts "Корень x1 = #{x1}"
else
	puts "Уравнение действительных решений не имеет"
end