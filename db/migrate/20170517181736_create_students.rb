class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :grad_year
      t.string :internship_company
      t.string :internship_location
      t.string :internship_position
      t.string :full_time_company
      t.string :full_time_position
      t.string :full_time_location
      t.string :current_status
      t.string :email

      t.timestamps

    end
  end
end
