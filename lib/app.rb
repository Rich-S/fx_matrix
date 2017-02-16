require 'sinatra/base'
require 'fx_matrix'	


class FXMatrix < Sinatra::Base

  set :root, File.dirname(__FILE__)
  
  scheduler = Rufus::Scheduler.new

  configure do
    uri = URI.parse(ENV["REDISCLOUD_URL"])
    $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  end

  helpers do
    def calc_returns(a,b) #a is the earlier set of the two
      array = []
      0.upto(a.count-1) do |i|
        array << a[i].zip(b[i]).map { |x| 
          r = (x.last/x.first - 1) 
          r == 0 ? '#ccc' : (r > 0 ? 'green' : 'red') 
          }
      end
      return array
    end
  end

  get '/' do
    erb :redux
  end

  conns = []

  get '/stream' do
    content_type 'text/event-stream'
    stream(:keep_open) do |out|
      scheduler.every '30s', :first_in => 0.5 do
        live_data = FX::Grid.new.price_data
        returns_data = calc_returns(CacheManager.lookback(1)||live_data,live_data)
        CacheManager.store live_data
        out << "data: #{live_data}\n"
        out << "data: #{returns_data}\n"
        out << "data: CLOSE\n\n"
      end
      out.callback { conns.delete(out) }
    end
  end

end