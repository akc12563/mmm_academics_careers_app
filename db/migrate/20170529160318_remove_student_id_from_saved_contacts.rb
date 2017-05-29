class RemoveStudentIdFromSavedContacts < ActiveRecord::Migration[5.0]
  def change
    remove_column :saved_contacts, :student_id, :integer
  end
end
