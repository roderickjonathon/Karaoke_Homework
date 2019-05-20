class Guest

  attr_reader :guest_name, :fave_song
  attr_accessor :wallet

  def initialize(guest_name, wallet, fave_song)
    @guest_name = guest_name
    @wallet = wallet
    @fave_song = fave_song

  end


  ## Function to reduce guests wallet by the amount the room costs
  def reduce_wallet(room_fee)
    @wallet -= room_fee
  end

  ## function to check if fave song is in playlist and celebrate if it is
  def fave_song_included?(playlist, song_name)
     if playlist.include?(song_name) == true
       return "Yaldi!"
     end
  end



end
