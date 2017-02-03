class AddRolesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :advertiser, :boolean, default: false
    add_column :users, :promoter, :boolean, default: false
  end
end
