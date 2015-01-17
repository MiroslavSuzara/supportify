class AddKeywordsToSupportRequests < ActiveRecord::Migration
  def change
    add_column :support_requests, :keywords, :text
  end
end

