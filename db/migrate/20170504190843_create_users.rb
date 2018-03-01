class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email , unique:true
      t.string :password_digest
      t.string :age
      t.string :phone_num
      t.text :address
      
      t.text :type_career_1
      t.text :type_term_1
      t.text :type_career_2
      t.text :type_term_2
      t.text :type_career_3
      t.text :type_term_3


      t.timestamps null: false
    end
  end
end
