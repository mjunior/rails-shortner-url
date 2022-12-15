class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :original
      t.string :short
      t.integer :total_access
      t.string :title

      t.timestamps
    end
  end
end
