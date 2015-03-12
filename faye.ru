require 'faye'
load 'lib/faye_ext.rb'
faye = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
faye.add_extension(UsersEvent.new)
run faye