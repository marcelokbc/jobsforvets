class AddColumnSlugToPosition < ActiveRecord::Migration[7.0]
  def change
    add_column :positions, :slug, :string
  end
end
