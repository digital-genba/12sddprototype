class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :username
      t.string :password_digest
      t.text :likes
      t.text :dislikes

      t.timestamps null: false
    end
  end
end
