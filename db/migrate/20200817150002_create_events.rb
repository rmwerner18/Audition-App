class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :location
      t.string :type
      t.integer :casting_agent_id

      t.timestamps
    end
  end
end
