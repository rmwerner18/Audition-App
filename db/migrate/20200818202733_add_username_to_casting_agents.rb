class AddUsernameToCastingAgents < ActiveRecord::Migration[6.0]
  def change
    add_column :casting_agents, :username, :string
    add_index :casting_agents, :username, unique: true
  end
end
