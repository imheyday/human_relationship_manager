FactoryGirl.define do
  factory :job_application do
    received_at DateTime.current
    cv 'my-cv.pdf'
    created_at DateTime.current
    updated_at DateTime.current
    association :contract_type
    association :candidate
  end
end
