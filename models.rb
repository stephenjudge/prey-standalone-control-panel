require 'mongo_mapper'

MongoMapper.database = ENV['mongo_db'] || 'prey_standalone_control_panel'

class Device
	include MongoMapper::Document
	
	key :name, String, :required => true
	key :missing, Boolean, :default => false
end
