class CreateReturns < ActiveRecord::Migration[7.0]
  def change
    create_table :returns do |t|
      t.references :borrow, null: false, foreign_key: true
      t.datetime :date_returned, null: false
      t.boolean :overdue, default: false
      t.decimal :penalty, default: 0.0, precision: 10, scale: 2

      t.timestamps
    end
  end
end
