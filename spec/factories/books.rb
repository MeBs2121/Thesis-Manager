FactoryBot.define do
  factory :book do
    author {"J.D.Salinger"}
    title {"The Catcher in the Rye"}
    main {false}

    association :user
  end
end
