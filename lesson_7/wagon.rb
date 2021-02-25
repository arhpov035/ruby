class Wagon
  attr_accessor :number
  include Company

  def initialize(number, type)
    @number = number
    @type = type
    puts "Создан вагон №#{@number} типа #{@type}"
    validate!
  end

  def type
    @type
  end

  def list
    return @number
  end

  protected

  def validate!
    raise "Номер вагона не может быть пустой" if number.nil?
    raise "Тип вагона не соответствует не отдному из существующих типов" unless @type == :cargo || @type == :passenger
    # rescue RuntimeError => e
    #   puts e
    true
  end

end
