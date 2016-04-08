require 'test_helper'

class AddVideoTest < ActiveSupport::TestCase
  test "it creates a video when valid" do
    result = AddVideo.call(youtube_url: "https://www.youtube.com/watch?v=SIQihN--98Y")
    assert_equal(true, result.success?)
    assert_equal(true, result.video.persisted?)
  end
end
