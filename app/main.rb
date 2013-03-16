
class TestApp < Sinatra::Base
  register Sinatra::CometIO
  io = Sinatra::CometIO

  get '/' do
    "testapp - sinatra-cometio v#{Sinatra::CometIO::VERSION}"
  end

  io.on :foo do |data, from|
    p data
    io.push :foo, data
  end

end
