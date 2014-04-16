require 'machinist/active_record'

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
  local_team_id { Team.make! }
  visitor_team_id { Team.make! }
end

Score.blueprint do
  local { 2 }
  visitor { 1 }
  match_time { Score::MATCH_TIMES["Partido"] }
  match
end
