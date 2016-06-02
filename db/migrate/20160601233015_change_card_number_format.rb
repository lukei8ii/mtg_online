class ChangeCardNumberFormat < ActiveRecord::Migration[5.0]
  def up
   change_column :cards, :number, :string
  end

  def down
   change_column :cards, :number, 'integer USING CAST(number AS integer)'
  end
end
