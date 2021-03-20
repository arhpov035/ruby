class Wagon
  include Company

  def initialize(number, type)
    @number = number
    @type = type
    @errors = []
    message_created
    raise StandardError.new(@errors.join(', ')) unless valid?
  end

  def valid?
    @errors << "Номер поезда не может быть пустой" if @number.nil?
    @errors << "Тип вагона не соответствует не отдному из существующих типов" unless @type == :freight || @type == :passenger
    @errors.empty?
  end
  def type
    puts "Этот вагон №#{@number} типа #{@type}"
  end

  def list
    return @number
  end

  protected

  def message_created
    puts "Создан вагон №#{@number} типа #{@type}"
  end
end
