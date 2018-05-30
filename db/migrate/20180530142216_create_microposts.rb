class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.string :title_what
      t.string :title_when
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
