class RemoveAgeFromStudents < ActiveRecord::Migration
  def self.up
    remove_column :students, :age
  end

  def self.down
    add_column :students, :age, :integer
  end
end
