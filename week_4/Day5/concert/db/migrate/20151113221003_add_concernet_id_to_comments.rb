class AddConcernetIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :concertnet_id, :integer
  end
end

