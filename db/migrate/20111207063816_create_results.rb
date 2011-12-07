class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.timestamp :date
      t.string :username
      t.string :email
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
