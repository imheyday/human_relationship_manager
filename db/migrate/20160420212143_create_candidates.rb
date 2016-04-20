class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.integer :year_of_birth

      t.timestamps null: false
    end
  end
end
