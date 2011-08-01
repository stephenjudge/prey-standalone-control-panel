require 'rubygems'
require 'bundler'
Bundler.setup

require 'models'
require 'routes'
require 'bowtie'

BOWTIE_AUTH = {:user => 'admin', :pass => 'secret'}

map "/check" do
  run Prey::Standalone
end

map "/" do
  run Bowtie::Admin
end
