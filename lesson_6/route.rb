  class Route

    def initialize(stations = [])
      @stations = stations
      @errors = []
      message_created
      raise StandardError.new(@errors.join(', ')) unless valid?
    end

    def valid?
      if @stations.class == Array
        @errors << "Route must consist of at least two stations" if @stations.size < 2
      end

      if @stations.nil?
        @errors << "The name must contain an array?"
      end
      @errors.empty?
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

    def message_created
      if @stations.class == Array
        puts "Route from #{@stations.first} to #{@stations.last} is created"if @stations.size > 1
        puts "Created a route from a single station #{@stations.first}" if @stations.size == 1
        puts "Empty route created" if @stations.empty?
      elsif @stations == nil
        puts "Empty route created"
      end
    end
  end
