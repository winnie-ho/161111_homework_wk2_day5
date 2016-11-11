require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../guest.rb')

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new("Totoro", 30.00,"Crocodile Rock")
  end

  def test_guest_info
    assert_equal(@guest1.name,"Totoro")
    assert_equal(@guest1.money, 30.00)
    assert_equal(@guest1.fav_song, "Crocodile Rock")
  end

  def test_fav_song_freakout

  end
end