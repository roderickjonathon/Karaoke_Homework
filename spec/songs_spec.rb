require("Minitest/autorun")
require("Minitest/rg")
require_relative("../songs.rb")



class SongTest < MiniTest::Test

  def setup

    @Song1 = Song.new("Three Little Birds")
    @Song2 = Song.new("Purple Haze")

  end

   def test_song_has_name
      assert_equal("Three Little Birds", @Song1.song_name)
   end

end
