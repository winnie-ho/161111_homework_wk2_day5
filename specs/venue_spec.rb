require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../room.rb')
require_relative ('../song.rb')
require_relative ('../guest.rb')
require_relative ('../venue.rb')

class TestVenue < Minitest::Test
  
  def setup
    @venue = Venue.new()
    @room2 = Room.new(1, 6, 5.0)
    @room1 = Room.new(2, 10, 7.5)
    @guest1 = Guest.new("Totoro", 50.00, "A Little Monster")
    @guest2 = Guest.new("Ponyo", 5.00, "Sad")

    @song1  = Song.new("A Little Monster", "Someone" )
  end

#doesn't seem to add to the array. 
  def test_add_room
    @venue.add_room(@room1)
    @venue.add_room(@room2)
    assert_equal(@venue.room_array.count, 2)
  end

  def test_room_array_info
    @venue.add_room(@room1)
    @venue.add_room(@room2)
    assert_equal(@venue.room_array[0].room_num, 2)
    assert_equal(@venue.room_array[1].capacity, 6)
    assert_equal(@venue.room_array[0].entry_fee, 7.5)
  end



end