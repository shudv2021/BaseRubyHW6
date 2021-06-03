require_relative 'modules.rb'
require_relative 'inst_counter'
class Carriage
  include Producer
  include Counter
  attr_reader :carr_num
  def initialize(carr_num)
    @carr_num = carr_num
    increase_counter
  end
end