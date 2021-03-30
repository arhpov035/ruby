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

train_1 = Train.new("123-tb", :freight)
train_2 = Train.new("234-tb", :passenger)

wagon_1 = Wagon.new(66, :freight)

station_1 = RailwayStation.new("Moscow")
station_2 = RailwayStation.new("Krasnoyarsk")

station_1.take_train(train_1.list)
station_1.take_train(train_2.list)
block_s = Proc.new do |train|
  puts "*****************************************"
  puts "Поезд #{train.delete_at(0)} отправлен со станции"
end

station_1.each_train(&block_s)
block_t = Proc.new do |wagon|
  puts "Объект поезда № #{wagon.number} передан в блок"
end
# train_1.accept_wagon(&block_t)

