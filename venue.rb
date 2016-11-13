class Venue

  attr_accessor :room_array

  def initialize()
    @room_array = []
  end

  def add_room(room)
    @room_array << room
  end

  def remove_room(room)
    @room_array.delete(room)
  end
end