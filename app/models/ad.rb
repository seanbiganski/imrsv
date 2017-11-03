class Ad < ApplicationRecord

  has_many :ad_activities

  has_attached_file :file, { validate_media_type: false }

  validates :title, length: { in: 5..50 }
  validates :file, presence: true
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
