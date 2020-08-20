class AddPicToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :pic, :string
  end
end
