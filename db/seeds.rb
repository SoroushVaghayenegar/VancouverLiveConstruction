# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Soroush",
             username: "soroush",
             password:              "123",
             password_confirmation: "123",
             admin: true,
             pref_ip: true,
             pref_up: false,
             pref_rc: false)