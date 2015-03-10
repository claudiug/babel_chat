require 'faye'
faye = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
# faye.on(:subscribe) do |client_id, channel|
#   puts "#{client_id} ==> #{channel}"
# end
# faye.on(:publish) do |client_id, channel, data|
#   puts "#{client_id} == #{channel} == #{data}"
# end
run faye