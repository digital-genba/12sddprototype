class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    #drop_table :posts
    create_table :posts do |t|
      t.integer "user_id"
      t.string "posttype"
      t.string "title"
      t.text "tags"
      t.text "content"
      t.text "extdata"
      t.timestamps
    end
  end
end
