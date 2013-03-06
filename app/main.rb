
class TestApp < Sinatra::Application

  get '/' do
    "testapp - sinatra-cometio v#{Sinatra::CometIO::VERSION}"
  end

  CometIO.on :foo do |data, from|
    p data
    push :foo, data
  end

end
