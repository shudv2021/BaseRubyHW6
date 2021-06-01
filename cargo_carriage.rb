require_relative 'modules.rb'
class CargoCarriage
  include Producer
  attr_reader :type, :carr_num
  def initialize(carr_num)
    @type = :cargo
    @carr_num = carr_num
  end
end