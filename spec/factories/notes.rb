FactoryBot.define do
  factory :note do
    title {"summary"}
    body {"Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."}
    page {23}
    book

    after(:create) do |note|
      create(:note_category_relation, note: note, category: create(:category))
    end
  end
end
