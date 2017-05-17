class AddSavedContactCountToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :saved_contacts_count, :integer
  end
end
