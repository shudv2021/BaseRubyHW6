

require_relative 'modules.rb'
require_relative 'inst_counter.rb'
class Train
  include Producer
  include InstanceCounter


  @@train_all = []
  @@instances = 0
  def self.find(train_num)
    @@train_all.each do |train|
      return train if train.train_num == train_num
    end
    return nil
  end

  attr_reader :train_num, :route, :current_station, :speed, :type, :total_carriages
  def initialize(train_num)
    @train_num = train_num
    @total_carriages = []
    @route
    @speed = 0
    @@train_all<<self
    self.register_instance
  end

  def add_speed(add_sp)
    @speed += add_sp
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)

    if @speed != 0
      puts 'Невозможно добавить вагон в движущийся состав.'
    return nil
    elsif carriage.type != self.type
      puts 'Невозможно добавить вагон в состав другого типа.'
    return nil
    else @total_carriages.push(carriage)
    end
  end

  def unhook
    @total_carriages.pop if @speed == 0
  end

  def sent_train(route)
    @current_station.delete_train(self) if @current_station != nil
    @route = route
    @current_station = route.all_stations[0]
    @current_station.all_trains.push(self)
  end

  def move_back
    move(prev_station)
  end

  def move_forvard
    move(next_station)
  end

  private
  def prev_station
    if @route.all_stations.index(@current_station) == 0
      return nil
    else
      @route.all_stations[@route.all_stations.index(@current_station) - 1]
    end
  end

  def next_station
    if @route.all_stations.index(@current_station)  == @route.all_stations.size
      return nil
    else
      #puts @route.all_stations.index(@current_station)
      #puts @route.all_stations.size
      return @route.all_stations[@route.all_stations.index(@current_station) + 1]
    end
  end

  def move(station)
    if station.nil?
      puts ' Движение на заданную станцию невозможно '
      return nil
    end
    @current_station.all_trains.delete(self)
    @current_station = station
    @current_station.all_trains.push(self)
  end

end