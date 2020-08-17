class CreateCastingAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :casting_agents do |t|
      t.string :name
      t.string :agency

      t.timestamps
    end
  end
end
