class Train
  attr_accessor :speed
  attr_accessor :quantity_wagons
  attr_reader :type

  def initialize(type, quantity_wagons)
    @type = type
    @quantity_wagons = quantity_wagons
    @speed = 0
  end

  def increase_speed
    self.speed += 10
    puts "Скорость увеличина"
  end

  def show_speed
    puts "Текущая скорость #{self.speed}"
  end

  def stop
    self.speed = 0
    puts "Поезд остановлен"
  end

  def show_quantity_wagons
    puts "Прицепленно вагонов #{self.quantity_wagons}"
  end

  def attach_wagons
    if @speed == 0
      self.quantity_wagons += 1
      puts "Вагон успешно прицеплён, всего прицепленно #{quantity_wagons}"
    else
      puts 'Вы не можете прицепить вагон на ходу'
    end
  end

  def unhook_wagons
    if @speed == 0
      self.quantity_wagons -= 1
      puts "Вагон успешно отцеплен, всего вагонов #{quantity_wagons}"
    else
      puts 'Вы не можете отцепить вагон на ходу'
    end
  end

  #принять маршрут следования
  def accept_route(itinerary)
    puts "Маршрут принят"
    return @itinerary = itinerary
  end

  def shift_station(station)
    if @itinerary.all_station.include?(station)
      @station = station
      puts "Поезд переместился на #{ station } станцию"
    else
      puts "Нет такого маршрута"
    end
    puts @itinerary
  end

  def prev_station
    if @station.empty?
      puts 'Это первая станция'
    elsif @itinerary.all_station.index(@station) == 0
      puts 'Это первая станция'
    elsif @itinerary.all_station.index(@station) > 0
      @station = @itinerary.all_station[@itinerary.all_station.index(@station) - 1]
      puts "Предыдущая станция #{@station}"
    end
  end

  def current_station
    if @station.empty?
      puts "Текущая станция #{@itinerary.all_station[0]}"
    else
      puts "#{@itinerary.all_station[@itinerary.all_station.index(@station)]}"
    end
  end

  def next_station
    if @itinerary.all_station.index(@station) < @itinerary.all_station.size - 1
      @station = @itinerary.all_station[@itinerary.all_station.index(@station) + 1]
      puts @station
      puts "Номер #{@itinerary.all_station.index(@station)}"
      puts "Всего #{@itinerary.all_station.size}"
    elsif @itinerary.all_station.index(@station) == @itinerary.all_station.size - 1
      puts "Это последняя станция"
    end
  end
end

class RailwayStation

  def initialize(name_station)
    @name_station = name_station
    @train = []
    # @train_type = {}
  end

  def accept_train(train)
    @train << train
    # puts @train[0].type
  end

  def all_trail
    @train.each do |train|
      puts train.type
    end
  end

  def all_trail_type
    cargo = []
    passenger = []

    @train.each do |train|
      if train.type == "Грузовой"
        cargo << train.type
      elsif train.type == "Пассажирский"
        passenger << train.type
      end
    end

    puts "#{cargo.count} грузовых и #{passenger.count} пассажирских"
  end

  def send_train
    send_train = @train.last
    @train.pop
    puts "#{send_train.type} поезд отправлен"
  end

end

class Route
  def initialize(start = 'Москва Павелецкая', final = 'Тамбов-1', intermediate = ["Узуново", "Михайлов"])
    @start = start
    @final = final
    @intermediate = intermediate

    build_route
  end

  def build_route
    @all_station = []
    @all_station << @start
    @intermediate.each do |val|
      @all_station << val
    end
    @all_station << @final
  end

  def show_station (param)
    if param == "s"
      puts "Начальная станция #{ @start }"
    elsif param == "f"
      puts "Конечная станция #{ @final }"
    elsif param == "i"
      puts "Список промежуточных станций:"
      @intermediate.each do |station|
        puts station
      end
    end
  end

  def add_station(station, param)
    if param == "s"
      @all_station.insert(1, station)
      puts "Станция #{station} добавленна после начальной станции"
    elsif param == "f"
      @all_station.insert(-1, station)
      puts "Станция #{station} добавленна в конец промежуточной станции"
    elsif param == "i"
      @all_station.insert(-2, station)
      puts "Станция #{station} добавленна в конец списка"
    end
  end

  def del_station(station)
    @all_station.delete(station)
    puts "Станция #{station} удалена"
  end

  def all_station
    @all_station
  end
end