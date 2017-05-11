class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name, {null: false}
      t.integer :phase, {null: false}
      t.string :gender
      t.float :gpa
      t.integer :num_detentions
      t.string :shirt_size
      t.string :dietary_restrictions
      t.string :emergency_contact_name, {null: false}
      t.string :emergency_contact_num, {null: false}
      t.references :teacher

      t.timestamps(null: false)
    end
  end
end
# Student.create(name: 'Stacy', phase: 3, emergency_contact_name: 'Anthony', emergency_contact_num: '1234' )
