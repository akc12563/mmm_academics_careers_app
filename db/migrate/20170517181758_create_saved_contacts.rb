class CreateSavedContacts < ActiveRecord::Migration
  def change
    create_table :saved_contacts do |t|
      t.integer :student_id
      t.integer :user_id

      t.timestamps

    end
  end
end
