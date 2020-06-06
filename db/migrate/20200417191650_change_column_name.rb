class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :activities, :usserId, :userId
  end
end
