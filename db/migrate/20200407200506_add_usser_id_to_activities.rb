class AddUsserIdToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :usserId, :string
  end
end
