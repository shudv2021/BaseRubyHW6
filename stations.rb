require_relative 'inst_counter.rb'
class Station
  attr_reader :station_name, :all_trains
  include Counter
  @@station_all = []
  def self.get_all
    @@station_all
  end

  def initialize (station_name)
    @station_name = station_name
    @all_trains = []
    @@station_all<<self
    increase_counter
  end
  #Все методы используются другими классами
  def add_train(train)
    @all_trains<<train
  end

  def delete_train(train)
    @all_trains.delete(train)
  end

  def return_all_trains
    @all_trains
  end

end

# +Может принимать поезда (по одному за раз)
# +Может возвращать список всех поездов на станции,
# +находящиеся в текущий момент
# +Может возвращать список поездов на станции по типу
# +(см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз,
# при этом, поезд удаляется из списка поездов, находящихся на станции).