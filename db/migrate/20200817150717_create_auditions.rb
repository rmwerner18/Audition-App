class CreateAuditions < ActiveRecord::Migration[6.0]
  def change
    create_table :auditions do |t|
      t.time :time
      t.integer :actor_id
      t.integer :event_id

      t.timestamps
    end
  end
end
