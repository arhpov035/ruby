class Train
  include Company
  include InstanceCounter
  attr_accessor :speed, :wagon, :type, :route, :station, :number

  @@train_list = {}
  NUMBER_FORMAT = /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}/

  def initialize(number, type)
    register_instance
    @type = type
    @number = number
    @errors = []
    message_created
    raise StandardError.new(@errors.join(', ')) unless valid?
    @speed = 0
    @wagons = []
    @@train_list[number] = self
  end

  def valid?
    @errors << "The train number cannot be empty" if number.nil?
    @errors << "Wrong train format" if number.to_s !~ NUMBER_FORMAT
    @errors << "Wrong type of train" unless type == :freight || type == :passenger
    @errors << "Train with a number #{number} already exists" if @@train_list.key?(number)
    @errors.empty?
  end

  def self.find(number)
    @train_list[number]
  end

  def speed_up
    @speed += 20
  end

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    if wagon_such_train?(wagon) && speed_zero?
      @wagons << wagon.list
    elsif !wagon_such_train?(wagon) && !speed_zero?
      raise "Сначала остановите поезд, для того что бы добавить к нему вагон"
    elsif !wagon_such_train?(wagon)
      raise "Вы не можете присоединить этот вагон к этому поезду"
    end
  end

  def list_wagon
    @wagons
  end

  def delete_wagon
    if speed_zero?
      @wagons.pop
    else
      raise "Сначала остановите поезд"
    end
  end

  def take_route(station)
    @station = station
    puts "Поезд №#{@number} готов ехать с станции #{@station.first} на станцию #{@station.last}"
  end

  def move(station)
    if @route.include?(station)
      @station = station
      puts "Поезд №#{@number} приехал на с станцию #{@station}"
    else
      puts "Такой станции нет в маршруте"
    end
  end

  def list
    return { @number => @type }
  end

  def accept_wagon(&block)
    @wagons.each do |wagon|
      block.call(wagon)
    end
    puts "--------------------------------"
    puts "Все объекты переданны успешно!!!"
  end

  private

  # Методы вынесены потому что они не используются клиентским кодом, а только другими методами.

  def speed_zero?
    @speed.zero?
  end

  def count_hash_dublicate(hash, value)
    count = 0
    hash.values.each do |t|
      if t == value
        count += 1
      end
    end
    return count
  end

  def wagon_such_train?
  end

  def message_created
    puts "Собран новый поезд №#{@number}, типа #{@type}"
  end

end
