class AddPicToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :pic, :string
  end
end
