class CreateReceivedBages < ActiveRecord::Migration[5.2]
  def change
    create_table :received_bages do |t|
      t.references :user, foreign_key: true
      t.references :bage, foreign_key: true

      t.timestamps
    end
  end
end
