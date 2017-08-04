require_relative './bike'

class DockingStation

  def initialize(capacity = 20)
     @bikes = []
     @capacity = capacity
  end
    
  attr_reader :bikes, :capacity

  def release_bike
      raise "No bikes available" if empty?
      @bikes.pop
  end

  def dock_bike(bike)
    raise "Docking station full" if full?
      @bikes << bike
  end

  def bike_been_docked?
      "#{@bikes} been docked"
  end
  
  private
  def full?
    @bikes.count == @capacity
  end

  def empty?
    @bikes.count == 0
  end

end




#  def fixed_capacity(size, other)
 #    Array.new(2) {|i| other[i] } 
  # end
    


# def bike_show
#    @bike
#  end