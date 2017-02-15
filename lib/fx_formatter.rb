module FX

   class Formatter < List 

      def as_js_format
         hash = Hash.new { |k,v| k[v] = [] }
         @structure.values.each_with_object(hash) do |item,obj|
            pair = item.pair
            quote = item.quote
            price = item.price
            obj[quote].push [pair,price] if item.quote == quote
         end
      end

      def price_data
         as_js_format.values.map { |x| x.map { |y| y.last } }
      end

   end

end