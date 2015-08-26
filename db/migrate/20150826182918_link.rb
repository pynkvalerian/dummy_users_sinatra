class Link < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :long_url
      t.string :short_url
      t.timestamps
    end
  end
end
