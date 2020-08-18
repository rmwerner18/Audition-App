class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :actor_id
      t.integer :event_id
      t.time :requested_time

      t.timestamps
    end
  end
end
