class AddSchoolYearMajorSelfDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :school, :string
    add_column :users, :year, :string
    add_column :users, :major, :string
    add_column :users, :self_description, :text
  end
end
