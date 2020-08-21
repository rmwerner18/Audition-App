class AddColumnsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :about, :text
    add_column :events, :show_dates, :string
    add_column :events, :show_location, :string
  end
end
