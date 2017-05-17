class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date_time
      t.string :location
      t.string :audience

      t.timestamps

    end
  end
end
