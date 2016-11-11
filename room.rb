class Room

attr_accessor :bar_tab, :room_playlist, :guests_register
attr_reader :room_num, :capacity, :entry_fee

def initialize (room_num, capacity, entry_fee)
  @room_num = room_num
  @capacity = capacity
  @entry_fee = entry_fee
  @bar_tab = 0
  @room_playlist = []
  @guests_register = []
end




end