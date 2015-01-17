class AddStatusToSupportRequests < ActiveRecord::Migration
  def change
    add_column :support_requests, :status, :boolean, default: false
  end
end
