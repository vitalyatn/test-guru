class AddBoolFiledToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :successful, :bool, default: false
  end
end
