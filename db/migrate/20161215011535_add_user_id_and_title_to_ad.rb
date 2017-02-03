class AddUserIdAndTitleToAd < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :title, :string
    add_reference :ads, :user, foreign_key: true
  end
end
