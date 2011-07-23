class AddIpaperToDeck < ActiveRecord::Migration
  def self.up
	  add_column :decks,  :ipaper_id, 			:integer
	  add_column :decks,  :ipaper_access_key, 	:string
  end

  def self.down
	  remove_column :decks,  :ipaper_id 
	  remove_column :decks,  :ipaper_access_key
  end
end
