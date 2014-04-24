require 'machinist/active_record'

User.blueprint(:admin) do
 name { "Admin" }
 email { "admin#{sn}@app.com" }
 role { "admin" }
 password { "12345678" }
 password_confirmation { "12345678" }
end

User.blueprint(:regular) do
 name { "Regular" }
 email { "regular#{sn}@app.com" }
 role { "regular" }
 password { "12345678" }
 password_confirmation { "12345678" }
end

Group.blueprint do
  name { "Group #{sn}" }
end

Group.blueprint(:with_teams) do
  name { "Group #{sm}" }
  teams(4)
end

Team.blueprint do
  name { "Team #{sn}" }
  abbr { "T#{sn}" }
  group
end

Match.blueprint do
  date { Time.now }
  stadium { "Stadium #{sn}" }
  local_team_id { Team.make!.id }
  visitor_team_id { Team.make!.id }
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
