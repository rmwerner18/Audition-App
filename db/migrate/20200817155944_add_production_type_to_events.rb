class AddProductionTypeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :production_type, :string
  end
end
