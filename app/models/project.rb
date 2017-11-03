class Project < ApplicationRecord

  #belongs_to :user
  has_many :ad_activities

  validates :name, length: { in: 5..50 }
  validates :token, length: { is: 36 }, uniqueness: true
end
