require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../song.rb')

class TestSong < Minitest::Test

  def setup
    @song1 = Song.new("Crocodile Rock", "Elton John")
  end

  def test_song_info
    assert_equal("Crocodile Rock", @song1.title)
    assert_equal("Elton John", @song1.artist)
  end



end