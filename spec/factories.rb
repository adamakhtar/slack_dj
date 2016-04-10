FactoryGirl.define do
  sequence :uuid do |n|
    n
  end

  sequence :url do |n|
    "https://www.youtube.com/watch?v=5KU1EqeUuT#{n}"
  end

  factory :player do
  end

  factory :playlist do
  end

  factory :user do
    slack_id uuid
  end

  factory :video do
    playlist_id 1
    url
  end
end