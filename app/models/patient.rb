class Patient < ActiveRecord::Base
	has_many :goals

	def name
		"#{self.preferred_name} #{self.surname}"
	end

	def linked?
	  oauth_token.present? && oauth_secret.present?
	end

	def fitbit_data
	  raise "Account is not linked with a Fitbit account" unless linked?
	  @client ||= Fitgem::Client.new(
	              :consumer_key => ENV["FITBIT_CONSUMER_KEY"],
	              :consumer_secret => ENV["FITBIT_CONSUMER_SECRET"],
	              :token => fitbit_oauth_token,
	              :secret => fitbit_oauth_secret,
	              :user_id => uid
	            )
	end

	def has_fitbit_data?
	  !@client.nil?
	end
end
