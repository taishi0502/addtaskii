class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :mission, null: false
      t.date :startdate, null: false
      t.date :limitdate, null: false
      t.timestamps
    end
  end
end
