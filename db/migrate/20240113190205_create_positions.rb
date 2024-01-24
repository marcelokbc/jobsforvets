class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :career, default: 0
      t.integer :contract, default: 0
      t.boolean :remote
      t.string :city
      t.string :state
      t.text :summary
      t.text :description
      t.boolean :publish
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
