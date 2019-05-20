class Room

  attr_reader :room_num, :entry_fee, :playlist
  attr_accessor :guests_checked_in, :till

  def initialize(room_num, entry_fee, playlist, guests_checked_in, till)
    @room_num = room_num
    @entry_fee = entry_fee
    @playlist = playlist
    @guests_checked_in = guests_checked_in
    @till = till
  end

  # ## Function to increase till when guests checks in
  #
  # def increase_till(room_fee)
  #   @till += room_fee
  # end

  ## Function to check guest IN to room
  def check_in(guest_name, entry_fee)
    @guests_checked_in.push(guest_name)
    @till += entry_fee
    guest_name.reduce_wallet(entry_fee)
  end

  ## Function to check guest OUT of room
  def check_out(guest_name)
    @guests_checked_in.delete(guest_name)
  end

  ## Function to play song in room??

  ## Function to add songs to playlist
  def add_to_playlist(song_name)
    @playlist.push(song_name)
  end

  ## Function to determine if there is space for more guests
  def room_for_more?
    if @guests_checked_in.length < 4
      return true
    else
      return false
    end
  end




end
