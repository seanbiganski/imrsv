class AddFileToAds < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :ads, :file
  end

  def self.down
    remove_attachment :ads, :file
  end
end
