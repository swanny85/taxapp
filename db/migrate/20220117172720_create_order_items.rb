class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.string :name
      t.boolean :imported, default: false
      t.boolean :sales_tax_exempt, default: false
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
