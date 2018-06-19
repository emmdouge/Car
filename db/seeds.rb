# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Person.create!([
  { id: 1, name: 'Sam', email: 'sam@gmail.com', phone: '2221114444' },
  { id: 2, name: 'Bob', email: 'bob@gmail.com', phone: '1112223333' },
  { id: 3, name: 'John', email: 'john@gmail.com', phone: '3331115555' },
  { id: 4, name: 'Gary', email: 'gary@gmail.com', phone: '8887770000' },
])

Automobile.create!([
  { id: 1, model: 'Prius', make: 'Toyota', color: 'blue', mileage: 1200, forsale: true },
  { id: 2, model: 'Corona', make: 'Toyota', color: 'red', mileage: 600, forsale: false },
  { id: 3, model: 'Ford', make: 'Taunus', color: 'black', mileage: 300, forsale: true },
  { id: 4, model: 'Cadillac', make: '61', color: 'red', mileage: 100, forsale: false },
  { id: 5, model: 'Fiat', make: '500', color: 'white', mileage: 5, forsale: true }
])