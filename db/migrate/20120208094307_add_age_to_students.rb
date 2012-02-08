class AddAgeToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :age, :integer
  end

  def self.down
    remove_column :students, :age
  end
end
