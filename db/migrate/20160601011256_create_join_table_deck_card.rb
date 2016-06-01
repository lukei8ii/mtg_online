class CreateJoinTableDeckCard < ActiveRecord::Migration[5.0]
  def change
    create_join_table :decks, :cards, { table_name: :decks_cards } do |t|
      t.integer :amount
      t.index [:deck_id, :card_id]
    end
  end
end
