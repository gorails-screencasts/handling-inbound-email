class CreateForumThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :forum_threads do |t|
      t.references :user, foreign_key: true
      t.string :subject

      t.timestamps
    end
  end
end
