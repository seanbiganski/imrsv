class Ad < ApplicationRecord

  has_many :ad_activities

  has_attached_file :file

  validates :title, length: { in: 5..50 }
  validates :file, presence: true

  do_not_validate_attachment_file_type :file

end
