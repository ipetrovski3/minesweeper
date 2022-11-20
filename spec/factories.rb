FactoryBot.define do
  factory :board do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    height { 10 }
    width { 10 }
    bombs { 10 }
    pattern { BoardService.call(height: height, width: width, bombs: bombs) }
  end
end
