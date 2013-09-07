class SetDefaultValueToActiveMatchedInRequests < ActiveRecord::Migration
  def change
  	change_column :requests, :active, :boolean, default: true
  	change_column :requests, :matched, :boolean, default: false  	
  end
end
