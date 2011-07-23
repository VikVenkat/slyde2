class AddScribdfuToDeck < ActiveRecord::Migration
  def self.up
      add_column :decks, :scribd_id, :integer
      add_column :decks, :scribd_access_key, :string


  end

  def self.down
      remove_column :decks, :scribd_id
      remove_column :decks, :scribd_access_key

  end
end
