class Currency

   attr_reader :pair, :quote, :base, :price, :timestamp 

   def initialize(pair)
      @pair, @quote, @base = pair, pair[0..2], pair[3..5]	#i.e. in a usdjpy pair, quote=usd & base=jpy
      @price, @timestamp = variables_from_get_request.first, variables_from_get_request.last
   end
      
   private
     
   def variables_from_get_request
      raw_html = get_quote
      if raw_html.include? "N/A"
         Array.new(2)#[nil,nil]
      else
         parse_quote_from_get_request(raw_html)
      end
   end

   def parse_quote_from_get_request(raw_string)
      array_value = raw_string.split(',').map { |x| eval x }
      price_value, date_value = array_value[1], DateTime.strptime(array_value[2..3].join(' '), '%m/%d/%Y %L:%M%p')
      #returns [114.4670,#<DateTime: 2017-01-16T02:14:00+00:00>], reference on strptime directives: https://ruby-doc.org/stdlib-2.1.1/libdoc/date/rdoc/Date.html#method-c-strptime
   end
      
   def get_quote		
      Net::HTTP.get URI.parse "http://download.finance.yahoo.com/d/quotes.csv?e=.csv&f=sl1d1t1&s=#{@pair}=X"
      #returns raw format of GET request: "\"usdjpy=X\",114.4670,\"1/13/2017\",\"10:03pm\"\n" or "\"usdmxp=X\",N/A,N/A,N/A\n" if error
   end

end


