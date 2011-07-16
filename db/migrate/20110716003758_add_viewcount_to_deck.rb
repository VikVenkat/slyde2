class AddViewcountToDeck < ActiveRecord::Migration
  def self.up
    add_column :decks, :viewcount, :integer
  end

  def self.down
    remove_column :decks, :viewcount
  end
end
