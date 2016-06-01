class CreateJoinTableCardSubtype < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cards, :subtypes do |t|
      t.index [:subtype_id, :card_id]
    end
  end
end
