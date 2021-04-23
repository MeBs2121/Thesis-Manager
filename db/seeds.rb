User.create!([
  {email: "example@email.com", encrypted_password: "$2a$12$d8JZIIYbw4LjFKjvSxrxyOhB/cUIfGIYsT0ACGFzfIr/759n3Rgwy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "testuser"}
])
Note.create!([
  {title: "テスト", body: "おおおおおおおおおおおおおおおおおおおおおおおおおおおてすとおおおおおおおおおおおおおおお", book_id: 1, page: 23},
  {title: "テストノート", body: "おおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおおお", book_id: 1, page: 40},
  {title: "はる", body: "あったかい", book_id: 1, page: 43},
  {title: "つかれた", body: "yasumitai", book_id: 1, page: 23},
  {title: "未読", body: "どんな内容なんだ", book_id: 2, page: 1}
])
Category.create!([
  {name: "Bigger's fear"},
  {name: "Bigger"},
  {name: "心情"}
])
Book.create!([
  {author: "Richard Wright", title: "Native Son", main: true, user_id: 1},
  {author: "Richard Wright", title: "Black Boy", main: false, user_id: 1},
  {author: "追立祐嗣", title: "ビガー・トーマスとは何者か", main: false, user_id: 1}
])
NoteCategoryRelation.create!([
  {note_id: 2, category_id: 1},
  {note_id: 3, category_id: 1},
  {note_id: 3, category_id: 2},
  {note_id: 3, category_id: 3},
  {note_id: 9, category_id: 3},
  {note_id: 10, category_id: 3},
  {note_id: 11, category_id: 3}
])
ActiveStorage::Blob.create!([
  {key: "9q08xcry5ay9ver1ho7ot2pprxru", filename: "Native-Son.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>758, "height"=>1168, "analyzed"=>true}, byte_size: 60449, checksum: "RBztH+KO0RlS20RKgq5Pgg=="},
  {key: "ldjlkvmouiwf1nh6paa2ayfjw3vh", filename: "black boy.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>332, "height"=>500, "analyzed"=>true}, byte_size: 30421, checksum: "QTP6CqQeZor43vTWsatIqQ=="},
  {key: "sns3jo0ocgkvxa3ihv4oguyme3lw", filename: "ビガー.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>210, "height"=>293, "analyzed"=>true}, byte_size: 7319, checksum: "YJ6810h+Dw21PJs0n7sAvg=="}
])
ActiveStorage::Attachment.create!([
  {name: "image", record_type: "Book", record_id: 1, blob_id: 1},
  {name: "image", record_type: "Book", record_id: 2, blob_id: 2},
  {name: "image", record_type: "Book", record_id: 4, blob_id: 3}
])
