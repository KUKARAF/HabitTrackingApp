class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :myName
      t.date :myDate
      t.time :myTime

      t.timestamps
    end
  end
end
