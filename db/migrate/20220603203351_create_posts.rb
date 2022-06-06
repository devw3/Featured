class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.datetime :date_publish
      
      t.timestamps
    end
  end
end
