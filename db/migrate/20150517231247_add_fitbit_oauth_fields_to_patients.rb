class AddFitbitOauthFieldsToPatients < ActiveRecord::Migration
  def change
  	add_column :patients, :fitbit_oauth_token, :string
  	add_column :patients, :fitbit_oauth_secret, :string
  end
end
