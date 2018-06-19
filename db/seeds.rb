# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Person.destroy_all
Person.create!([
  { id: 1, name: 'Sam', email: 'sam@gmail.com', phone: '2221114444' },
  { id: 2, name: 'Bob', email: 'bob@gmail.com', phone: '1112223333' },
  { id: 3, name: 'John', email: 'john@gmail.com', phone: '3331115555' },
  { id: 4, name: 'Gary', email: 'gary@gmail.com', phone: '8887770000' },
])

Automobile.destroy_all
Automobile.create!([
  { id: 1, model: 'Prius', make: 'Toyota', color: 'blue', mileage: 1200, forsale: true },
  { id: 2, model: 'Corona', make: 'Toyota', color: 'green', mileage: 600, forsale: false },
  { id: 3, model: 'Ford', make: 'Taunus', color: 'black', mileage: 300, forsale: true },
  { id: 4, model: 'Cadillac', make: '61', color: 'red', mileage: 100, forsale: false },
  { id: 5, model: 'Fiat', make: '500', color: 'white', mileage: 5, forsale: true },
  { id: 6, model: 'Chrylser', make: 'Charger', color: 'red', mileage: 5, forsale: true },
  { id: 7, model: 'BMW', make: 'Arrow', color: 'blue', mileage: 5, forsale: true }
])

Ownership.destroy_all
Ownership.create!([
  { id: 1, person_id: 1, automobile_id: 1, own: true },
  { id: 2, person_id: 2, automobile_id: 2, own: true },
  { id: 3, person_id: 3, automobile_id: 3, own: true },
  { id: 4, person_id: 4, automobile_id: 4, own: true },
  { id: 5, person_id: 5, automobile_id: 5, own: true },
  
  { id: 6, person_id: 1, automobile_id: 5, own: false },
  { id: 7, person_id: 2, automobile_id: 4, own: false },
  { id: 8, person_id: 3, automobile_id: 3, own: false },
  { id: 9, person_id: 4, automobile_id: 2, own: false },
  { id: 10, person_id: 5, automobile_id: 1, own: false },
  
  { id: 11, person_id: 1, automobile_id: 7, own: true },
])