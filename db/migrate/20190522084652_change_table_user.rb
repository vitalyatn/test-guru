class ChangeTableUser < ActiveRecord::Migration[5.2]
  def change
    remove_column(:users, :score)
  end
end
