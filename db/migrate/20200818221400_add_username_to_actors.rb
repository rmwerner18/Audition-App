class AddUsernameToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :username, :string
    add_index :actors, :username, unique: true
  end
end
