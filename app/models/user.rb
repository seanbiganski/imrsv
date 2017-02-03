class User < ApplicationRecord
  include Clearance::User

  has_many :ads
  has_many :projects

end
