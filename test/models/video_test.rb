require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  test "extracts youtube video id from url before validation" do
    video = Video.new(url: "https://www.youtube.com/watch?v=SIQihN--98Y")
    video.valid?
    assert_equal("SIQihN--98Y", video.youtube_id)
  end

  test "#next returns video with higher id" do
    a = Video.create(url: "https://www.youtube.com/watch?v=xxxxxxxxxxx")
    b = Video.create(url: "https://www.youtube.com/watch?v=yyyyyyyyyyy")

    assert_equal(b, a.next)
  end
end
