class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.timestamps
      t.string :url, null: false
      t.string :short
    end

    add_index :urls, :url
    add_index :urls, :short
  end
end
