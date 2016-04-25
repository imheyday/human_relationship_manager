FactoryGirl.define do
  factory :candidate do
    first_name 'françois'
    last_name 'Blanchard'
    email 'francois.blanchard1@gmail.com'
    gender 'male'
    year_of_birth 1991
    created_at DateTime.current
    updated_at DateTime.current
  end
end
