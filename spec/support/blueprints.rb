require 'machinist/active_record'
require 'faker'

User.blueprint(:admin) do
  name { "Admin" }
  last_name { "Application" }
  nickname { Faker::Internet.user_name }
  email { "admin#{sn}@app.com" }
  role { "admin" }
  password { "12345678" }
  password_confirmation { "12345678" }
end

User.blueprint(:regular) do
  name { "Regular" }
  last_name { "Application" }
  nickname { Faker::Internet.user_name }
  email { "regular#{sn}@app.com" }
  role { "regular" }
  password { "12345678" }
  password_confirmation { "12345678" }
end

Group.blueprint do
  name { "Group #{sn}" }
end

Group.blueprint(:with_teams) do
  name { "Group #{sn}" }
  teams(4)
end

Team.blueprint do
  name { "Team #{sn}" }
  abbr { "T#{sn}" }
  group
end

Match.blueprint do
  date { Time.now }
  group_id { 1 }
  stadium { "Stadium #{sn}" }
  local_team_id { Team.make!.id }
  visitor_team_id { Team.make!.id }
  match_number { Faker::Number.digit  }
end

Score.blueprint do
  local { 2 }
  visitor { 1 }
  match_time { Score::MATCH_TIMES["Partido"] }
  match
end

Pool.blueprint do
  name { "Quiniela #{sn}" }
  end_date { Date.today + 80 }
  completed { false }
  price { 2000 }
  matches(5)
end

Bet.blueprint do
  local { 0 }
  visitor { 0 }
  completed { false }
  user { User.make!(:regular) }
  pool { Pool.make! }
  match_time { Score::MATCH_TIMES["Partido"] }
  # match should be a match that belong to pool
end

Answer.blueprint do
  answer_one { "wherever you want" }
  answer_two { "incorrect" }
  user
  pool
end

Registration.blueprint do
  name { "Registration #{sn}" }
  last_name { "Application" }
  nickname { Faker::Internet.user_name }
  phone { '0414-3761125' }
  email { "register#{sn}@gmail.com" }
  pool { Pool.make! }
end