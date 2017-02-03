class Ad < ApplicationRecord

  belongs_to :user
  has_many :ad_activities
  
  has_attached_file :file

  validates :title, length: { in: 5..50 }
  validates :file, presence: true

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
end
