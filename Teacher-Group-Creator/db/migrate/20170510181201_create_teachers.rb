class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name, {null: false}
      t.string :email, {null: false}
      t.integer :admin_status, {null: false}
      t.string :password_digest, {null: false}

      t.timestamps(null: false)
    end
  end
end
