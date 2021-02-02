FactoryBot.define do
  factory :post do
    caption     {Faker::Lorem.sentence}
    describe    {""}
    place       {""}
    share_url   {""}
    youtube_url {""}

    association :user

    after(:build) do |post|
      post.video.attach(io: File.open('public/videos/test.mp4'), filename: 'test.mp4')
    end
  end
end
