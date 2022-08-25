class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :offers, :location, :address
  end
end
