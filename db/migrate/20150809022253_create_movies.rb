class CreateNovels < ActiveRecord::Migration
  def change
    create_table :novels do |t|
      t.string :title
      t.string :rating
      t.text :description
      t.datetime :release_date
      t.string :short_comment
      t.string :medium_comment
      t.string :long_comment
      # Add fields that let Rails automatically keep track
      # of when Novels are added or modified:
      t.timestamps
    end
  end
end
