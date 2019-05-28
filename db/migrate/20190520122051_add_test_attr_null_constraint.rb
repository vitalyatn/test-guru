class AddTestAttrNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :title, false)
    change_column_null(:questions, :body, false)
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :correct, false)
    change_column_null(:users, :name, false)
    change_column_null(:users, :score, false)
  end
end