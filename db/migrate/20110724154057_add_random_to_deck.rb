class AddRandomToDeck < ActiveRecord::Migration
  def self.up
    add_column :decks, :random, :string
  end

  def self.down
    remove_column :decks, :random
  end
end
