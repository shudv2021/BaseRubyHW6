require_relative 'train.rb'
require_relative 'inst_counter'
class CargoTrain < Train
  def initialize(train_num)
    super
    @type = :cargo
  end
end