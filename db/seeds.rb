# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 c1 = Comment.create(body: "No parent", user_id: 1, link_id: 1)
 c2 = Comment.create(body: "Child1", user_id: 1, link_id: 1, parent_id: 1)
 c3 = Comment.create(body: "Child1's Child1", user_id: 1, link_id: 1, parent_id: 2)
 c4 = Comment.create(body: "Child1's Child1's Child", user_id: 1, link_id: 1, parent_id: 3)
 c5 = Comment.create(body: "Child2", user_id: 1, link_id: 1, parent_id: 1)
 c6 = Comment.create(body: "Child3", user_id: 1, link_id: 1, parent_id: 1)
 c7 = Comment.create(body: "Child2's Child1", user_id: 1, link_id: 1, parent_id: 5)

 u1 = User.create(username: "FapJay", password: "asdf", email: "herp@gmail.com")

 s1 = Sub.create(user_id: 1, title: "Look at this cat!")