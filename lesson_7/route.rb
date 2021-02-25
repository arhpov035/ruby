class Route

  def initialize(stations = [])
    @stations = stations
    validate!
    message_created
  end

  def valid?
    validate!
  rescue
    false
  end

  def add(station)
    raise "Станция не относится к классу #{RailwayStation}" unless station.class == RailwayStation
    @stations.insert(-2, station.name)
  end

  def delete(station)
    if @stations.include?(station)
      @stations.delete(station)
      puts "Станция #{station} удалена из маршрута"
    else
      puts "Станции #{station} станции нет в маршруте"
    end
  end

  def list
    puts "Маршрут от #{@stations.first} до #{@stations.last}"
    @stations.each_with_index { |station, index| puts "#{index + 1}. #{station}" }
  end

  private

  def validate!
    raise "Название станции обязательно к заполнению" if @stations.nil?
    raise "В маршруте должно быть не меее двух станций" if @stations.size <= 1
    true
  end

  def message_created
    puts "Маршрут от #{@stations.first} до #{@stations.last} создан"
  end
end
