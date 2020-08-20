class AddPicToCastingAgents < ActiveRecord::Migration[6.0]
  def change
    add_column :casting_agents, :pic, :string
  end
end
