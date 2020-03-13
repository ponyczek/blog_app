FactoryBot.define do
  factory :article do |f|
    f.title { Faker::Hipster.sentence(word_count: 3, supplemental: true) }
    f.body { Faker::Hipster.sentence(word_count: 50, supplemental: true) }
    f.draft { true }
  end 
end