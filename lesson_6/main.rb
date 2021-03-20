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

# begin
#   RailwayStation.new nil # Пустое имя чтобы проверить валидацию
#   RailwayStation.new 'mos'
# rescue StandardError => error
#   puts error.message
# end

# begin
#   Route.new [1]
# rescue StandardError => error
#   puts error.message
# end

# begin
#   Train.new "123-tb", :freight
# rescue StandardError => error
#   puts error.message
# end

begin
  Wagon.new nil, nil
rescue StandardError => error
  puts error.message
end
