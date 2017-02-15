module FX
   
   class Grid < Formatter
      
      attr_reader :queue, :structure
     
      def initialize
         @structure = all_pairs_hash      
         queue.map_with_threads { |fx| @structure[fx] = Currency.new fx }
      end     
     
      def queue
         queue_array = all_pairs         
         queue_array.extend Threading
         return queue_array
      end 

   end

end

