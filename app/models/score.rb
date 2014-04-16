class Score < ActiveRecord::Base
  belongs_to :match

  MATCH_TIMES = { "Partido" => "full-time", "Prorroga" => "aggregate", "Penales" => "penalties" }
end
