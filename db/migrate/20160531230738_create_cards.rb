class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :cmc
      t.string  :flavor
      t.string  :image_name
      t.string  :layout
      t.string  :mana_cost
      t.integer :multiverse_id
      t.string  :name
      t.integer :number
      t.string  :power
      t.string  :rarity
      t.string  :text
      t.string  :card_type
    end
  end
end
