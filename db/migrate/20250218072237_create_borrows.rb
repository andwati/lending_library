class CreateBorrows < ActiveRecord::Migration[7.0]
  def change
    create_table :borrows do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :date_borrowed, null: false
      t.integer :duration, null: false
      t.date :due_date, null: false

      t.timestamps
    end
  end
end
