class CreateSubtypes < ActiveRecord::Migration[5.0]
  def change
    create_table :subtypes do |t|
      t.string :name
    end
  end
end