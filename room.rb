class Room

  attr_accessor :tab, :room_playlist, :guest_register
  attr_reader :room_num, :capacity, :entry_fee

  def initialize (room_num, capacity, entry_fee)
    @room_num = room_num
    @capacity = capacity
    @entry_fee = entry_fee
    @tab = 0
    @room_playlist = []
    @guest_register = []
  end

  def checkin_guest(guest)
    unless entry_fee>guest.money
      @guest_register << guest
      @tab+=entry_fee.to_f
    end
  end

  def checkout_guest(guest)
    unless @guest_register.count == 0
      for checked_in_guest in @guest_register
        if checked_in_guest == guest
          @guest_register.delete(guest)
        end
      end
    end
  end

  def room_full()
    if @guest_register.count>=@capacity
      true
    else
      false
    end
  end


  def add_song(song)
    @room_playlist << song
  end

  def remove_song(song)
    @room_playlist.delete(song)
  end

  def add_to_tab(value)
    @tab+=value.to_f
    return @tab
  end

end