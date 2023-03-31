# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

User.create(
  nickname: 'TestUser1', 
  email: 'test1@com', 
  password: 'test00',
  introduction: 'ダイエット中',
  year_of_birth: '1980',
  sex_id: '2',
  purpose_id: '3',
  target_date: '2023-05-01',
  height: '170',
  target_weight: '65',
  target_fat: '12',
  activity_level_id: '2',
  publish_target_id: '2',
  publish_daily_id: '2',
  publish_height_id: '2',
  publish_tweet_id: '2'
)

User.create(
  nickname: 'TestUser2', 
  email: 'test2@com', 
  password: 'test00',
  introduction: '増量中',
  year_of_birth: '1980',
  sex_id: '3',
  purpose_id: '2',
  target_date: '2023-05-01',
  height: '165',
  target_weight: '60',
  target_fat: '20',
  activity_level_id: '3',
  publish_target_id: '3',
  publish_daily_id: '3',
  publish_height_id: '3',
  publish_tweet_id: '3'
)

require "date"

weight = 80
fat = 30
day = Date.new(2023,2,28)

30.times do |i|
  Daily.create(
    input_day: day + i,
    weight: weight - (i * 0.15),
    fat: fat - (i * 0.2),
    user_id: 1
  )
end