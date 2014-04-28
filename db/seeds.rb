# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

m = Magazine.create title: "Laba dienaa"
m.issues.create number: 1
m.issues.create number: 2


Magazine.create title: "Sestdienas brokastis"