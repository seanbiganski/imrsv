class AdActivity < ApplicationRecord

  belongs_to :project
  belongs_to :ad

  validates :ad_id, presence: true
  validates :project_id, presence: true
end
