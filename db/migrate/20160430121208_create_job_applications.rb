class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.datetime :received_at
      t.text :cv_file
      t.references :candidate, index: true, foreign_key: true
      t.references :contract_type, index: true, foreign_key: true
      t.references :job_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
