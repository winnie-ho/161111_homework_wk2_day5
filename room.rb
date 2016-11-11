class Room

  attr_accessor :bar_tab, :room_playlist, :guest_register
  attr_reader :room_num, :capacity, :entry_fee

  def initialize (room_num, capacity, entry_fee)
    @room_num = room_num
    @capacity = capacity
    @entry_fee = entry_fee
    @bar_tab = 0
    @room_playlist = []
    @guest_register = []
  end

  def add_guest(guest)
    unless entry_fee>guest.money
      @guest_register << guest.name
    end
  end

  def add_song(song)
    @room_playlist << song.title
  end

  def room_full()
    if @guest_register.count>=@capacity
      true
    else
      false
    end
  end




end