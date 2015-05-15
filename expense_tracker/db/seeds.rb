# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




Category.create(category_title: 'Casa')
Category.create(category_title: 'Compras')
Category.create(category_title: 'Trabajo')
Category.create(category_title: 'Bachaqueo')
Category.create(category_title: 'Escorts')
Category.create(category_title: 'Otros')

Transaction.create(date:'2015-05-10', t_type: 1, amount: 10000, description: 'Escapada al Euro', category_id: 1)
Transaction.create(date:'2015-04-11', t_type: 1, amount: 3000, description: 'Gimnasio', category_id: 1)
Transaction.create(date:'2015-04-20', t_type: 1, amount: 60000, description: 'Los roques viaje', category_id: 2)
Transaction.create(date:'2015-05-14', t_type: 1, amount: 8000, description: 'Helado en Versailles', category_id: 2)
Transaction.create(date:'2015-05-02', t_type: 1, amount: 500, description: 'Almuerzo en los chinos', category_id: 3)
Transaction.create(date:'2015-04-07', t_type: 1, amount: 100, description: '', category_id: 3)
Transaction.create(date:'2015-05-03', t_type: 1, amount: 450, description: 'Escapada al Euro', category_id: 4)
Transaction.create(date:'2015-04-25', t_type: 1, amount: 145, description: 'Escapada al Euro', category_id: 5)
Transaction.create(date:'2015-05-09', t_type: 1, amount: 7000, description: 'Escapada al Euro', category_id: 5)
Transaction.create(date:'2015-05-09', t_type: 1, amount: 100, description: 'Escapada al Euro', category_id: 6)