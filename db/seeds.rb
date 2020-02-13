# users
User.create(
  username: "admin",
  email: "admin@admin.com",
  password: "password",
  permission: "admin"
)
User.create(
  username: "johnny",
  email: "johnny@johnny.com",
  password: "password"
)
User.create(
  username: "sarah",
  email: "sarah@sarah.com",
  password: "password"
)
User.create(
  username: "lorem",
  email: "lorem@lorem.com",
  password: "password"
)
  User.create(
    username: "bert",
    email: "bert@bert.com",
    password: "password"
  )
    
    # jams
    Jam.create(
      name: "Christmas 2019",
      theme: "Yule log",
      status: "closed",
      start_date: Time.new(2019, 12, 1),
      end_date: Time.new(2019, 12, 23)
    )
    Jam.create(
      name: "New Years 2020",
      theme: "Resolutions",
      status: "closed",
      start_date: Time.new(2019, 12, 26),
      end_date: Time.new(2020, 1, 12)
    )
    Jam.create(
      name: "V-Day 2020",
      theme: "Chocolate",
      status: "upcoming",
      start_date: Time.new(2020, 2, 1),
      end_date: Time.new(2020, 2, 23)
    )
    Jam.create(
      name: "St. Patties Day 2020",
      theme: "Pub Crawl",
      status: "upcoming",
      start_date: Time.new(2020, 3, 1),
      end_date: Time.new(2020, 3, 20)
    )
      


  # stories
  
  Story.create(
    title: "Magna",
    content: "Lorem ipsum dolor sit amet",
    published: true,
    user_id: "2",
    jam_id: "1"
  )
  Story.create(
    title: "Cillume",
    content: "Lorem ipsum dolor sit amet",
    published: true,
    user_id: "2",
    jam_id: "2"
  )
  Story.create(
    title: "Aloqui",
    content: "Lorem ipsum dolor sit amet",
    published: false,
    user_id: "2",
    jam_id: "3"
  )
  
  Story.create(
    title: "Laborris",
    content: "Lorem ipsum dolor sit amet",
    published: true,
    user_id: "3",
    jam_id: "2"
  )
  Story.create(
    title: "Ullemco",
    content: "Lorem ipsum dolor sit amet",
    published: true,
    user_id: "3",
    jam_id: "4"
  )
  Story.create(
    title: "Nisi",
    content: "Lorem ipsum dolor sit amet",
    published: false,
    user_id: "3",
    jam_id: "4"
  )

  Story.create(
    title: "Veniam",
    content: "Lorem ipsum dolor sit amet",
    published: true,
    user_id: "4",
    jam_id: "1"
  )
  Story.create(
    title: "Nostrud",
    content: "Lorem ipsum dolor sit amet",
    published: true,
    user_id: "4",
    jam_id: "2"
  )
  Story.create(
    title: "Sit",
    content: "Lorem ipsum dolor sit amet",
    published: false,
    user_id: "4",
    jam_id: "3c"
  )
  Story.create(
    title: "Amet",
    content: "Lorem ipsum dolor sit amet",
    published: false,
    user_id: "4",
    jam_id: "4"
  )

  Story.create(
    title: "Dolor",
    content: "Lorem ipsum dolor sit amet",
    published: true,
    user_id: "5",
    jam_id: "2"
  )
  Story.create(
    title: "Ipsum",
    content: "Lorem ipsum dolor sit amet",
    published: false,
    user_id: "5",
    jam_id: "3"
  )