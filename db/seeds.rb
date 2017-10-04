User.create(name: 'Админ Админович', admin: true, password: 'qweqwe', password_confirmation: 'qweqwe', email: 'admin@email.ru')

User.create(name: 'Пользователь Пользователевич', password: 'qweqwe', password_confirmation: 'qweqwe', email: 'user@email.ru')

inns = [
  ['Альфа', File.open('app/assets/images/alpha.jpg'), rand(5..10)],
  ['Бета', File.open('app/assets/images/beta.jpg'), rand(5..10)],
  ['Вега', File.open('app/assets/images/vega.jpg'), rand(5..10)]
]

inns.each do |name, image, room_count|
  Inn.create(name: name, image: image, room_count: room_count)
end

Room.all.shuffle.take(7).each do |room|
  room.bookings.create(user: User.second, room: room)
  room.update(is_free: false)
end
