require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../room.rb')
require_relative ('../guest.rb')
require_relative ('../song.rb')



class TestRoom < Minitest::Test

  def setup
    @room1 = Room.new(2, 10, 7.5)
    @guest1 = Guest.new("Totoro", 50.00, "A Little Monster")
    @guest2 = Guest.new("Ponyo", 5.00, "Sad")

    @song1  = Song.new("A Little Monster", "Someone" )
  end

  def test_room_info
    assert_equal(@room1.room_num, 2)
    assert_equal(@room1.capacity, 10)
    assert_equal(@room1.entry_fee, 7.5)
  end

  def test_bar_tab_starts_at_0
    assert_equal(@room1.bar_tab, 0)
  end

  def test_add_guest
    @room1.add_guest(@guest1)
    assert_equal("Totoro", @room1.guest_register[0])
  end

  def test_add_guest__can_afford_fee
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.guest_register.count)
  end

  def test_add_guest__cant_afford_fee
    @room1.add_guest(@guest2)
    assert_equal(0, @room1.guest_register.count)
  end

  def test_add_song
    @room1.add_song(@song1)
    assert_equal("A Little Monster", @room1.room_playlist[0])
  end

  def test_room_full
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.room_full
    assert_equal(false,@room1.room_full)
  end


end