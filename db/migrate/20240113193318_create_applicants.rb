class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.string :social_name
      t.string :email
      t.string :phone
      t.string :cpf
      t.string :zipcode
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :linkedin
      t.string :gender
      t.string :bio
      t.integer :status, default: 0

      t.references :user, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
