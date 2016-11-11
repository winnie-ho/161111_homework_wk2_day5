require ('pry-byebug')

class Venue

  attr_accessor :room

  def initialize (room)
    @room_array = []
  end


  def add_room(room)

    @room_array << room.room_num
  end

end