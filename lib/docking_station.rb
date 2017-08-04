require_relative './bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
     @bikes = []
     @capacity = capacity
  end
    
  attr_reader :bikes, :capacity

  def release_bike
      raise "No bikes available" if empty?
      @bikes.each_with_index do |bike, index| 
        if bike.working?
          @bikes.delete_at(index)
          return bike
        end
      end
      raise "No bikes available"
  end

  def dock_bike(bike, broken = false)
    raise "Docking station full" if full?
    bike.report_broken if broken == true
      @bikes << bike
  end

  def bike_been_docked?
      "#{@bikes} been docked"
  end

  def fix_bikes
    @bikes.each do |bike|
      bike.fix
    end
  end

  def show_bikes
    "There are currently #{@bikes.length} bikes in this station"
    return @bikes
  end
  
  
  
  private
  def full?
    @bikes.count == @capacity
  end

  def empty?
    @bikes.count == 0
  end

end