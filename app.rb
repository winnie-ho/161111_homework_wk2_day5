require_relative('venue')
require_relative('room')
require_relative('guest')
require_relative('song')

@venue = Venue.new

@menu1 = "
MENU 1 (type number to select)
  - 0 Exit
  - 1 Create Room
  - 2 View Existing Rooms"

@menu2 = "MENU 2 (type number to select)
  - 0 MENU BACK
  - 1 Check-In Guest
  - 2 Check-Out Guest
  - 3 Add Song to Room
  - 4 Add Order to Tab"
  

def create_room_interface()

  puts "Enter room name/number"
  room_num = gets.chomp
  puts "Set room capacity"
  capacity = gets.chomp
  puts "Set entry fee"
  entry_fee = gets.chomp

  puts "New room details, press enter to confirm:
    Room Number: #{room_num}
    Room Capacity: #{capacity}
    Entry Fee: #{entry_fee}"
  gets.chomp

  room_to_add = Room.new(room_num, capacity, entry_fee)
  @venue.add_room(room_to_add)
end

def view_existing_rooms_interface()
  if @venue.room_array.count == 0
      puts "
      There are currently no rooms"
      menu_1_loop
  else
    puts "Type room number to edit or go back"
    puts "  - 0 MENU BACK"

      @venue.room_array.inject(1){|count,r| 
        puts "  - " + count.to_s + " "+ r.room_num
        count + 1
      }
  end
end

    # puts "Enter room number to view"
    # view_room_num = gets.chomp
    # puts @venue.room_array[view_room_num]

def exit_interface()
    puts "Exiting, Goodbye!"
end 

def checkin_interface()
  if @taken>=@space
    puts "This room is full"
  else
    puts "Check-in guest to room: #{@venue.room_array[@menu_room_select-1].room_num}"


    puts "Enter name of guest"
    name = gets.chomp
    puts "Enter money"
    money = gets.chomp
    puts "Enter their favourite song"
    fav_song = gets.chomp

    puts "New guest details, press enter to confirm:
      Name: #{name}
      Credit: #{money}
      Favourite Song: #{fav_song}"
    gets.chomp

    guest_to_add = Guest.new(name, money, fav_song)

    @venue.room_array[@menu_room_select-1].checkin_guest(guest_to_add)
  end
end





#MENU 1 loop

def menu_1_loop()
  puts @menu1
  menu1_select = gets.chomp.to_i
    if menu1_select == 0
      exit_interface()
    elsif menu1_select == 1
      create_room_interface()
      menu_1_loop
    elsif menu1_select == 2
      view_existing_rooms_interface()
      menu_room_loop()
    else
      menu1_select != 0||1||2
      puts "ERROR, enter a valid option"
      menu_1_loop
    end
end


#MENU room loop
def menu_room_loop()
  @menu_room_select = gets.chomp.to_i
    if @menu_room_select == 0
      menu_1_loop

    else @venue.room_array.find{|r|@venue.room_array.index} == @menu_room_select-1

      menu_2_loop

    end




end



#MENU 2 loop

def menu_2_loop()
  @taken = @venue.room_array[@menu_room_select-1].guest_register.count
  @space = @venue.room_array[@menu_room_select-1].capacity.to_i - @venue.room_array[@menu_room_select-1].guest_register.count

  puts "You are viewing/editing room: #{@venue.room_array[@menu_room_select-1].room_num}"
  puts "There are #{@taken.to_s} guests and #{@space.to_s} space(s) left"
  puts @menu2
  menu2_select = gets.chomp.to_i
    if menu2_select == 0
      menu_1_loop
    elsif menu2_select == 1
      checkin_interface()
      menu_2_loop
    elsif menu2_select == 2
      checkout_interface()
      menu_2_loop
    elsif menu2_select == 3
      add_song_interface
      menu_2_loop
    elsif menu2_select == 4
      add_to_tab_interface
      menu_2_loop
    else menu2_select != 0||1||2||3||4
      puts "ERROR, enter a valid option"
      menu_2_loop
    end
end 


puts @venue.room_array
puts "Welcome to CodeClan Caraoke - putting the C in Karaoke!"
menu_1_loop

  # if menu1_select == 1
















# def find_guest(name, guests)
#   found = nil
#   for guest in guests
#     found = guest if guest.name == name
#   end
#   return found
# end

# guest1 = Guest.new("Totoro", 50.00, "A Little Monster")
# guest2 = Guest.new("Ponyo", 0.00, "Sad")
# guests = [guest1, guest2]
# room1 = Room.new(2, 10, 7.5)

# puts "Enter a guest name"
# guest_name = gets.chomp
# found = find_guest(guest_name, guests)

# room1.checkin_guest(found) if found
# puts room1.guest_register

