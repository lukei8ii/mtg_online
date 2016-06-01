class CreateJoinTableCardType < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cards, :types do |t|
      t.index [:type_id, :card_id]
    end
  end
end
