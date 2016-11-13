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
  - 1 Remove Room
  - 2 Check-In Guest
  - 3 Check-Out Guest
  - 4 Add Song to Room
  - 5 Remove Song from Room
  - 6 Add/remove from Room Tab"
  

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

def remove_room_interface()
  puts "Are you sure you want to delete room: #{@venue.room_array[@menu_room_select-1].room_num}?"
  puts "Y/N"
  answer = gets.chomp.downcase
    @venue.remove_room(@venue.room_array[@menu_room_select-1]) if answer == "y"
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


def exit_interface()
    puts "Exiting, Goodbye!"
    exit
end 

def checkin_interface()
  if @taken>=@venue.room_array[@menu_room_select-1].capacity.to_i
    puts "**Unable to add guest. This room is full!**"
    menu_2_loop
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

    @guest_to_add = Guest.new(name, money, fav_song)

    @venue.room_array[@menu_room_select-1].checkin_guest(@guest_to_add)

    if @venue.room_array[@menu_room_select-1].room_playlist.find{|s| s.title == @guest_to_add.fav_song}
      puts "'YAAA DANCER!!!', #{@guest_to_add.name} is delighted their favourite song is on the room playlist"
    end
    menu_2_loop()
  end
end

def checkout_interface
  if @venue.room_array[@menu_room_select-1].guest_register.count == 0
    puts "**There are no guests in this room!**"
  else
    puts "Select guest number you want to check out?"
    
    @venue.room_array[@menu_room_select-1].guest_register.inject(1){|count, g|
      puts "  - #{count.to_s} #{g.name}"
      count + 1
    }

    @guest_to_remove = gets.chomp.to_i
    puts "Are you sure you want to remove #{@venue.room_array[@menu_room_select-1].guest_register[@guest_to_remove-1].name} from room: #{@venue.room_array[@menu_room_select-1].room_num}?"
    puts "Y/N"
    answer = gets.chomp.downcase
    @venue.room_array[@menu_room_select-1].checkout_guest(@venue.room_array[@menu_room_select-1].guest_register[@guest_to_remove-1]) if answer == "y"
  end
end

def add_song_interface
    if @venue.room_array[@menu_room_select-1].room_playlist.count == 0
      puts "Current room playlist: EMPTY"

    else 
      puts "Current room playlist:"
      @venue.room_array[@menu_room_select-1].room_playlist.inject(1){|count,s|
      puts "  -#{count} #{@venue.room_array[@menu_room_select-1].room_playlist[count-1].title}: #{@venue.room_array[@menu_room_select-1].room_playlist[count-1].artist}"
      count+=1
      }
    end
      puts "Enter song title"
      title = gets.chomp
      puts "Enter song artist"
      artist = gets.chomp

      song_to_add = Song.new(title, artist)
      @venue.room_array[@menu_room_select-1].add_song(song_to_add)
end

def remove_song_interface
    if @venue.room_array[@menu_room_select-1].room_playlist.count == 0
      puts "Current room playlist: EMPTY"

    else 
      puts "Current room playlist:"
      @venue.room_array[@menu_room_select-1].room_playlist.inject(1){|count,s|
      puts "  -#{count} #{@venue.room_array[@menu_room_select-1].room_playlist[count-1].title}: #{@venue.room_array[@menu_room_select-1].room_playlist[count-1].artist}"
      count+=1
      }
    end
      puts "Select number of song to remove"
      song_to_remove = gets.chomp.to_i
      puts "Are you sure you want to remove #{@venue.room_array[@menu_room_select-1].room_playlist[song_to_remove-1].title} from room: #{@venue.room_array[@menu_room_select-1].room_num}?"
      puts "Y/N"
      answer = gets.chomp.downcase
      @venue.room_array[@menu_room_select-1].remove_song(@venue.room_array[@menu_room_select-1].room_playlist[song_to_remove-1]) if answer == "y"
end

def add_to_tab_interface
  puts "Enter value to add to room tab"
  value_to_add = gets.chomp
  @venue.room_array[@menu_room_select-1].add_to_tab(value_to_add)
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
      # view_existing_rooms_interface()
      menu_room_loop()
    else
      menu1_select != 0||1||2
      puts "ERROR, enter a valid option"
      menu_1_loop
    end
end


#MENU room loop
def menu_room_loop()
  view_existing_rooms_interface()
  @menu_room_select = gets.chomp.to_i
    if @menu_room_select == 0
      menu_1_loop()
    else @venue.room_array.find{|r|@venue.room_array.index} == @menu_room_select-1
      menu_2_loop()
    end
end



#MENU 2 loop

def menu_2_loop()
  @taken = @venue.room_array[@menu_room_select-1].guest_register.count
  @space = @venue.room_array[@menu_room_select-1].capacity.to_i - @venue.room_array[@menu_room_select-1].guest_register.count
  puts "___________________________________________"
  puts "You are viewing/editing room: #{@venue.room_array[@menu_room_select-1].room_num}"
  puts "There are #{@taken.to_s} guests and #{@space.to_s} space(s) left"
    if @venue.room_array[@menu_room_select-1].guest_register.count==0
      puts "Current guests in room: EMPTY"
    else
      puts "Current guests in room:"
           @venue.room_array[@menu_room_select-1].guest_register.inject(1){|count, g|
        puts "  - #{count.to_s} #{g.name}"
        count + 1
      }
    end

    if @venue.room_array[@menu_room_select-1].room_playlist.count==0    
      puts "Current room playlist: EMPTY"
    else
      puts "Current room playlist:"
      @venue.room_array[@menu_room_select-1].room_playlist.inject(1){|count,s|
      puts "  -#{count} #{@venue.room_array[@menu_room_select-1].room_playlist[count-1].title}: #{@venue.room_array[@menu_room_select-1].room_playlist[count-1].artist}"
      count+=1
      }
    end

    puts "Room tab: £#{@venue.room_array[@menu_room_select-1].tab}"
    puts "___________________________________________" 
    puts ""   


  puts @menu2
  menu2_select = gets.chomp.to_i
    if menu2_select == 0
      menu_room_loop()     
    elsif menu2_select == 1
      remove_room_interface()
      menu_room_loop
    elsif menu2_select == 2
      checkin_interface()
      menu_2_loop
    elsif menu2_select == 3
      checkout_interface()
      menu_2_loop
    elsif menu2_select == 4
      add_song_interface()
      menu_2_loop
    elsif menu2_select == 5
      remove_song_interface()
      menu_2_loop
    elsif menu2_select == 6
      add_to_tab_interface()
      menu_2_loop
    else menu2_select != 0||1||2||3||4||5||6
      puts "ERROR, enter a valid option"
      menu_2_loop
    end
end 



puts "Welcome to CodeClan Caraoke - putting the C in Karaoke!"
menu_1_loop()










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

