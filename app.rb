require_relative('room')
require_relative('guest')

def find_guest(name, guests)
  found = nil
  for guest in guests
    found = guest if guest.name == name
  end
  return found
end

guest1 = Guest.new("Totoro", 50.00, "A Little Monster")
guest2 = Guest.new("Ponyo", 0.00, "Sad")
guests = [guest1, guest2]
room1 = Room.new(2, 10, 7.5, guest1)

puts "Enter a guest name"
guest_name = gets.chomp
found = find_guest(guest_name, guests)

room1.add_guest(found) if found

