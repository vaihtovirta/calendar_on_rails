class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.integer :periodicity, default: 0
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
