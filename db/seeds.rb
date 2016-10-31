# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'Tyler', password: 'password')
User.create(username: 'Well', password: 'password')
User.create(username: 'Roman', password: 'password')

Game.create(user_id: 1, board: 'XO--X-O-X', outcome: 1)
Game.create(user_id: 1, board: 'O-X-OXX-O', outcome: 0)
Game.create(user_id: 1, board: 'XXOOXXXOO',  outcome: -1)

Game.create(user_id: 2, board: 'XO--X-O-X', outcome: 1)
Game.create(user_id: 2, board: 'O-X-OXX-O', outcome: 0)
Game.create(user_id: 2, board: 'XXOOXXXOO',  outcome: -1)

Game.create(user_id: 3, board: 'XO--X-O-X', outcome: 1)
Game.create(user_id: 3, board: 'O-X-OXX-O', outcome: 0)
Game.create(user_id: 3, board: 'XXOOXXXOO',  outcome: -1)
