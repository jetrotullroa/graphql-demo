class Player < ApplicationRecord
  belongs_to :team, optional: true

  scope :no_team, -> { where(team_id: nil) }
  scope :injured, -> { where(injured: true) }
end
