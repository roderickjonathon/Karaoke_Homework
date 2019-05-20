require("Minitest/autorun")
require("Minitest/rg")
require_relative("../guests.rb")
require_relative("../songs.rb")
require_relative("../room.rb")


class GuestTest < MiniTest::Test

  def setup

    @Song1 = Song.new("Three Little Birds")
    @Song2 = Song.new("Purple Haze")
    @Song3 = Song.new("Funky Kingston")
    @Song4 = Song.new("Jungle Boogie")
    @Playlist = [@Song1, @Song2, @Song3]
    @Guest1 = Guest.new("Jimmy", 20, @Song2)
    @Guest2 = Guest.new("Bob", 25, "Play that funky music")
    @Guest3 = Guest.new("Big Al", 40, @Song1)
    @Guests_in_room = [@Guest1, @Guest2]
    @Room27 = Room.new("27", 5, @Playlist, @Guests_in_room, 500)

  end

  def test_guest_has_name
    assert_equal("Jimmy", @Guest1.guest_name)
  end


  def test_guest_has_money
    assert_equal(20, @Guest1.wallet)
  end


  def test_guest_has_fave_song
    assert_equal(@Song2, @Guest1.fave_song)
  end

  def test_reduce_wallet
    @Guest1.reduce_wallet(@Room27.entry_fee)
    assert_equal(15, @Guest1.wallet)
  end

  def test_is_guests_fave_song_there?
    assert_equal("Yaldi!",  @Guest1.fave_song_included?(@Playlist, @Song2))
  end


end
