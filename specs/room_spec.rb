require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../room.rb')

class TestRoom < Minitest::Test

  def setup
    @room1 = Room.new(2, 10, 7.5)
  end

  def test_room_info
    assert_equal(@room1.room_num, 2)
    assert_equal(@room1.capacity, 10)
    assert_equal(@room1.entry_fee, 7.5)
  end

  def test_bar_tab_starts_at_0
    assert_equal(@room1.bar_tab, 0)
  end


end