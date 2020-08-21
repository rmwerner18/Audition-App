class AddAboutAndPastRolesToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :about, :text
    add_column :actors, :past_roles, :string
  end
end
