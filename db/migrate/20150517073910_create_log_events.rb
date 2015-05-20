class CreateLogEvents < ActiveRecord::Migration
  def change
    create_table :log_events do |t|
      t.integer :user_id
      t.integer :target_id
      t.string :target_type
      t.string :action

      t.timestamps null: false
    end
  end
end
