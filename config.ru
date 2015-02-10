$LOAD_PATH.unshift '.'
require 'lib/fidelius'
use Rack::ShowExceptions
run Fidelius::Base.new

