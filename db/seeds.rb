# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Users--------------------#
user_1 = User.create do |a|
  a.username = "bill_mars"
  a.email = "billmars@test.com"
  a.password = "12345678"
  a.fname = "Bill"
  a.lname = "Mars"
  a.location = "NYC"
end

user_2 = User.create do |a|
  a.username = "test"
  a.email = "test@test.com"
  a.password = "12345678"
  a.fname = "Q"
  a.lname = "W"
  a.location = "NYC"
end

user_3 = User.create do |a|
  a.username = "sojo"
  a.email = "sojo@test.com"
  a.password = "12345678"
  a.fname = "Sojo"
  a.lname = "Daniel"
  a.location = "NYC"
end

#Jobs--------------------#
job_1 = Job.create do |j|
  j.title = "Looking for Ruby dev"
  j.skills = "Ruby, HTML, CSS"
  j.description = "Test test test test test"
  j.tag_list = "ruby, html, css, sql"
  j.budget = 100
end

job_2 = Job.create do |j|
  j.title = "Rails project"
  j.skills = "Ruby, Rails, SQL, Javascript"
  j.description = "Test Test Test Test Test Test"
  j.tag_list = "rails, js"
  j.budget = 100
end

job_3 = Job.create do |j|
  j.title = "Need a Javacript developer"
  j.skills = "js, jquery, html, css"
  j.description = "Test Test Test Test Test Test"
  j.tag_list = "js, html, css"
  j.budget = 100
end

job_4 = Job.create do |j|
  j.title = "Experienced Ruby"
  j.skills = "ruby, jquery, html, css"
  j.description = "Test Test Test Test Test Test"
  j.tag_list = "ruby"
  j.budget = 100
end

job_5 = Job.create do |j|
  j.title = "Advanced JS developer wanted"
  j.skills = "js, jquery, html, css, sql"
  j.description = "Test Test Test Test Test Test"
  j.tag_list = "js"
  j.budget = 100
end

#Tags--------------------#
tag_1 = Tag.create do |a|
  a.name = "html"
end

tag_2 = Tag.create do |a|
  a.name = "js"
end

tag_3 = Tag.create do |a|
  a.name = "ruby"
end

tag_4 = Tag.create do |a|
  a.name = "sql"
end

tag_5 = Tag.create do |a|
  a.name = "css"
end

tag_6 = Tag.create do |a|
  a.name = "rails"
end
