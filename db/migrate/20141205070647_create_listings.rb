class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :status
      t.timestamps
    end
  end
end
