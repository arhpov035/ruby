class RailwayStation
  attr_accessor :name

  @@all_station = []

  def self.all
    @@all_station
  end

  def initialize(name)
    @name = name
    @trains = {}
    @errors = []
    message_created
    raise StandardError.new(@errors.join(', ')) unless valid?
    @@all_station << self # Что бы добавить инстанс, а не только его имя
  end

  def valid?
    @errors << "Имя является обязательным полем" if name.nil?
    @errors << "Название станции не может состоять менее чем из 4-x символов" if !name.nil? && name.length < 4
    @errors.empty?
  end

  def list
    puts "На станции сейчас #{@trains.length} поездов"
  end

  def list_type
    puts "На станции поездов типа Freight: #{count_hash_dublicate(@trains, "freight")}"
    puts "На станции поездов типа Passenger: #{count_hash_dublicate(@trains, "passenger")}"
  end

  def take_train(train = {})
    @number = train.keys.join
    @type = train.values.join
    if @number.nil? || @type.nil?
      puts "Невозможно принять такой поезд"
    else
      # @trains << {@number => @type}
      @trains[@number] = @type
      puts "Поезд с номером #{@number} и типом #{@type} принят на станцию"
    end
  end

  def send_train(train = {})
    @number = train.keys.join
    @type = train.values.join
    if @trains.include?({ @number => @type })
      @trains.delete({ @number => @type })
      puts "Поезд Номер: #{@number} покинул станцию"
    else
      puts "На станции нет такого поезда"
    end
  end

  private

  def message_created
    puts "Станция #{@name} cоздана"
  end
end
