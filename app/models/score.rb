class Score < ActiveRecord::Base
  belongs_to :match
  validates_presence_of :visitor, :local, :match_time

  MATCH_TIMES = { "Partido" => "full-time", "Prorroga" => "aggregate", "Penales" => "penalties" }

  def to_s
    "#{local}-#{visitor}"
  end

  def result
    valid? ? check_result : nil
  end

  private
    def check_result
      if local > visitor
        'local'
      elsif visitor > local
        'visitor'
      elsif local == visitor
        'draw'
      end
    end
end
