require_relative "./company.rb"
require_relative "./instance_counter.rb"

require_relative "./train.rb"
require_relative "./train_cargo.rb"
require_relative "./train_passenger.rb"

require_relative "./railway_station.rb"
require_relative "./route.rb"

require_relative "./wagon.rb"
require_relative "./wagon_cargo.rb"
require_relative "./wagon_passenger.rb"

# return
# load './main.rb'
puts "STRAT объект поез"
train_1 = Train.new("123-tb", :freight)
train_2 = Train.new("234-tb", :passenger)
puts "END объект поезда"

puts "STRAT объект вагонов"
wagon_1 = WagonCargo.new(1)
wagon_2 = WagonCargo.new(2)
wagon_3 = WagonPassenger.new(22)
puts "END объект вагонов"

puts "STRAT добавление вагонов"
train_1.add_wagon(wagon_1)
train_1.add_wagon(wagon_2)
train_1.add_wagon(wagon_3)
puts "END добавление вагонов"

puts "STRAT объект станций"
station_1 = RailwayStation.new("Moscow")
station_2 = RailwayStation.new("Krasnoyarsk")
puts "END объект станций"

puts "STRAT объект маршрут"
route_1 = Route.new(["Moscow", "Kazan", "Omsk", "Krasnoyarsk"])
route_2 = Route.new(["Novosibirsk", "Krasnoyarsk", "Irkutsk"])
puts "END объект маршрут"

puts "STRAT урок № 7 - задание 1"
station_1.take_train(train_1.list)
station_1.take_train(train_2.list)

train_list = station_1.list

block_s = Proc.new do |hash_train|
  puts "*****************************************"
  hash_train.each do |key, value|
    hash_train.delete(key)
    puts "Поезд № #{key} отправлен со станции"
  end
  puts "*****************************************"
  if hash_train.empty?
    puts "Все поезда уехали со станции"
  else
    puts "На станции остались поезда"
  end
end

station_1.all_send_train(&block_s)
puts "END урок № 7 - задание 1"

puts "STRAT урок № 7 - задание 2"

block_t = Proc.new do |wagon|
  puts "Объект поезда № #{wagon.number} передан в блок"
end
train_1.accept_wagon(&block_t)
puts "END урок № 7 - задание 2"