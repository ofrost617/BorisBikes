require_relative './bike'

class DockingStation

  def initialize(capacity = 2)
     @bikes = []
     @capacity = capacity
  end
    
  attr_reader :bikes, :capacity

  def release_bike
      raise "No bikes available" unless @bikes.count != 0
      @bikes.pop
  end

  def dock_bike(bike)
    raise "Docking station full" if full?
      @bikes << bike
  end

  def bike_been_docked?
      "#{@bikes} been docked"
  end
  
  def full?
    @bikes.count == @capacity
  end

end




#  def fixed_capacity(size, other)
 #    Array.new(2) {|i| other[i] } 
  # end
    


# def bike_show
#    @bike
#  end