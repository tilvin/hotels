FactoryGirl.define do
  factory :user do
    name 'user'
    email 'user@email.ru'
    password 'useruser'
    password_confirmation 'useruser'
    admin false
  end

  factory :admin, class: User do
    name 'admin'
    email 'admin@email.ru'
    password 'adminadmin'
    password_confirmation 'adminadmin'
    admin true
  end
end
