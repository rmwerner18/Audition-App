class AddAboutToCastingDirectors < ActiveRecord::Migration[6.0]
  def change
    add_column :casting_agents, :about, :text
  end
end
