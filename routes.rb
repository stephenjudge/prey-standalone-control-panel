require 'sinatra'

module Prey

	class Standalone < Sinatra::Base

		get '/:id' do
			if device = Device.find(params[:id])
				status device.missing? ? 404 : 200
			else
				status 400 # bad request
			end
		end

	end

end
