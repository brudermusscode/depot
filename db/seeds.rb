#---
# Excerpted from "Agile Web Development with Rails 6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails6 for more book information.
#---
# encoding: utf-8

Product.delete_all
Product.create!(
  title: 'Rails, Angular, Postgres and Bootstrap',
  description:
    %(
      Rails, Angular, Postgres and Bootstrap
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    ),
  image_url: 'dcbang.jpg',
  price: 10.00
)
# . . .
Product.create!(
  title: 'Ruby Performance Optimization',
  description:
    %(
      Rails, Angular, Postgres and Bootstrap
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    ),
  image_url: 'adrpo.jpg',
  price: 24.82
)
# . . .
Product.create!(
  title: 'Seven Mobile Apps in Seven Weeks',
  description:
    %(
      Rails, Angular, Postgres and Bootstrap
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    ),
  image_url: 'lorem.jpg',
  price: 9.99
)
# . . .
User.delete_all
User.create!(
  name: 'Admin',
  email: 'admin@shop.de',
  password: 'secretpassword'
)
