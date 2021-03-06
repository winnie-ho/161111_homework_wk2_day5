require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../room.rb')
require_relative ('../guest.rb')
require_relative ('../song.rb')

class TestRoom < Minitest::Test

  def setup
    @room1 = Room.new(2, 10, 7.5)
    @guest1 = Guest.new("Totoro", 50.00, "A Little Monster")
    @guest2 = Guest.new("Ponyo", 5.00, "Just Keep Swimming")
    @guest3 = Guest.new("Princess Mononoke", 20.00, "I Am The One and Only")
    @song1  = Song.new("A Little Monster", "Someone" )
  end

  def test_room_info
    assert_equal(@room1.room_num, 2)
    assert_equal(@room1.capacity, 10)
    assert_equal(@room1.entry_fee, 7.5)
  end

  def test_checkin_guest
    @room1.checkin_guest(@guest1)
    assert_equal("Totoro", @room1.guest_register[0].name)
  end

  def test_remove_guest
    @room1.checkin_guest(@guest1)
    @room1.checkin_guest(@guest2)
    @room1.checkin_guest(@guest3)
    @room1.checkout_guest(@guest1)
    assert_equal(1,@room1.guest_register.count)
  end

  def test_checkin_guest__can_afford_fee
    @room1.checkin_guest(@guest1)
    assert_equal(1, @room1.guest_register.count)
    assert_equal(7.5, @room1.tab)

  end

  def test_add_guest__cant_afford_fee
    @room1.checkin_guest(@guest2)
    assert_equal(0, @room1.guest_register.count)
  end

  def test_room_full
    @room1.checkin_guest(@guest1)
    @room1.checkin_guest(@guest2)
    @room1.room_full
    assert_equal(false,@room1.room_full)
  end

  def test_add_song
    @room1.add_song(@song1)
    assert_equal("A Little Monster", @room1.room_playlist[0].title)
  end

  def test_remove_song
    @room1.remove_song(@song1)
    assert_equal(0, @room1.room_playlist.count)
  end

  def test_add_to_tab
    @room1.add_to_tab(40)
    assert_equal(40,@room1.tab)
  end


end