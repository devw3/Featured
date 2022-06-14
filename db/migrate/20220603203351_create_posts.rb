class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :sub_title
      t.string :slug
      t.boolean :status
      t.datetime :date_publish
      
      t.timestamps
    end
  end
end
