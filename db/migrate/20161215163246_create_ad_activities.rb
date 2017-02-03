class CreateAdActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_activities do |t|
      t.integer :ad_id
      t.integer :project_id

      t.timestamps
    end
  end
end
