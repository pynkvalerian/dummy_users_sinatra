class ChangeUrlToLongUrl < ActiveRecord::Migration
  def change
    rename_column :urls, :url, :long_url
  end
end
