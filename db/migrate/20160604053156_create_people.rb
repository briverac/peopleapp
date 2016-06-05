class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, limit: 75, null: false
      t.string :last_name, limit: 75, null: false
      t.string :email, limit: 254, null: false
      t.string :job, limit: 75
      t.text :bio
      t.string :gender
      t.date :birthdate, null: false
      t.string :picture

      t.timestamps null: false
    end
  end
end
