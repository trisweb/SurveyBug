class AddQuestionKind < ActiveRecord::Migration
  def self.up
    add_column :questions, :kind, :text
  end

  def self.down
    remove_column :questions, :kind
  end
end
