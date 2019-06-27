class ChangeForeignKey < ActiveRecord::Migration[5.2]
  def change
    # remove_column(:questions, :category_id, :integer)
    # remove_column(:users, :category_id, :integer)
    # remove_column(:tests, :category_id, :integer)
    # remove_column(:answers, :question_id, :integer)
    # remove_column(:questions, :test_id, :integer)
    # remove_column(:passed_tests, :user_id, :integer)
    # remove_column(:passed_tests, :test_id, :integer)

    #remove_column(:questions, :category, :integer)
    #remove_column(:users, :category_id, :integer)
    remove_column(:tests, :category_id, :integer)
    remove_column(:answers, :question_id, :integer)
    remove_column(:questions, :test_id, :integer)
    remove_column(:passed_tests, :user_id, :integer)
    remove_column(:passed_tests, :test_id, :integer)

    add_reference(:tests, :category, foreign_key: true)
    add_reference(:answers, :question, foreign_key: true)
    add_reference(:questions, :test, foreign_key: true)
    add_reference(:passed_tests, :user, foreign_key: true)
    add_reference(:passed_tests, :test, foreign_key: true)
  end
end
