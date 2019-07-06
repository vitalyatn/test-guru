class AddAttributesToBages < ActiveRecord::Migration[5.2]
  def change
    add_column :bages, :rule, :string
    add_column :bages, :value, :string
  end
end
