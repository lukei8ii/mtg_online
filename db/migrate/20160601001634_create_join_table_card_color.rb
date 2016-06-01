class CreateJoinTableCardColor < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cards, :colors do |t|
      t.index [:color_id, :card_id]
    end
  end
end
