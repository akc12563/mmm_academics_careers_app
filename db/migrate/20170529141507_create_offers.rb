class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :company
      t.string :position
      t.boolean :intern_fulltime
      t.string :location
      t.string :status
      t.integer :user_id

      t.timestamps

    end
  end
end
