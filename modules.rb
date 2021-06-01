module Producer
  def insert_producer(producer)
    self.producer = producer
  end

  def show_producer
    self.producer
  end

  private
  attr_accessor :producer
end