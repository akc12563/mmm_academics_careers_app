class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.string :location
      t.text :job_description
      t.string :job_requirements
      t.string :job_link
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.datetime :deadline

      t.timestamps

    end
  end
end
