class Score < ActiveRecord::Base
  belongs_to :match
  validates_presence_of :visitor, :local, :match_time

  MATCH_TIMES = { "Partido" => "full-time", "Prorroga" => "aggregate", "Penales" => "penalties" }

  def to_s
    "#{local}-#{visitor}"
  end

end
