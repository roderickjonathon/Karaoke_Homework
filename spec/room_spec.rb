require("Minitest/autorun")
require("Minitest/rg")

require_relative("../guests.rb")
require_relative("../room.rb")
require_relative("../songs.rb")


class RoomTest < Minitest::Test

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


  def test_room_has_num
    assert_equal("27", @Room27.room_num)
  end

  def test_room_has_entry_fee
    assert_equal(5, @Room27.entry_fee)
  end

  def test_room_has_playlist
    assert_equal([@Song1, @Song2, @Song3], @Room27.playlist)

  end

  def test_which_guests_checked_in?
    assert_equal([@Guest1, @Guest2], @Room27.guests_checked_in)
  end

  def test_guest_can_check_in_and_is_charged_entry
    @Room27.check_in(@Guest3, @Room27.entry_fee)
    assert_equal([@Guest1, @Guest2, @Guest3], @Room27.guests_checked_in)
    assert_equal(505, @Room27.till)
    assert_equal(35, @Guest3.wallet)
  end

  def test_guest_can_check_out
    @Room27.check_out(@Guest2)
    assert_equal([@Guest1], @Room27.guests_checked_in)
  end


  def test_adding_song_to_playlist
    @Room27.add_to_playlist(@Song4)
    assert_equal([@Song1, @Song2, @Song3, @Song4], @Room27.playlist)
  end

  # def test_room_can_play_song
  #   @Room27
  # end

  def test_can_more_guests_join
    assert_equal(true, @Room27.room_for_more?)
  end

  # def test_charge_guest_fee
  #  @Room27.increase_till(@Room27.entry_fee)
  #  assert_equal(505, @Room27.till)
  # end






end
