class UpdateQuestionsOptions < ActiveRecord::Migration
  def self.up
    add_column :questions, :order, :integer
    add_column :questions, :text, :text
    add_column :options, :order, :integer
    add_column :options, :text, :text
    # New IDs for associations
    add_column :results, :survey_id, :integer
    add_column :questions, :survey_id, :integer
    add_column :options, :question_id, :integer
  end

  def self.down
    remove_column :questions, :order
    remove_column :questions, :text
    remove_column :options, :order
    remove_column :options, :text
    
    remove_column :results, :survey_id
    remove_column :questions, :survey_id
    remove_column :options, :question_id
  end
end
