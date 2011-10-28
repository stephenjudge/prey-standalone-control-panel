require 'sinatra'
require 'builder'

module Prey

	REPORT_MODULES = %w(geo network session webcam)

	class Standalone < Sinatra::Base

		get '/:id' do
			if device = Device.find(params[:id])
				content_type 'text/xml'
				status device.missing? ? 404 : 200
				generate_xml(device)
			else
				status 400 # bad request
			end
		end

		def generate_xml(device)
			builder do |xml|
				xml.instruct!
				xml.device do
					xml.status do
						xml.missing device.missing?
					end
					xml.configuration do
						xml.delay device.delay
					end
					xml.modules do
						device.module_list.split.each do |mod|
							xml.module :active => true, :name => mod, :type => module_type(mod) do
								xml.enabled true
							end
						end
					end
				end
			end
		end

		def module_type(mod)
			REPORT_MODULES.include?(mod) ? 'report' : 'action'
		end

	end

end
