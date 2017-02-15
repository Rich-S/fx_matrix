module Threading

   def self.extended(base)
      base.queue_threads
   end

   def map_with_threads(pool=12)	# threadpool of 10 if no argument is given
      [*1..[@queue.length,pool].min].map do 
         work = @queue.pop(true) rescue nil
         Thread.new { self.push yield(work) } 
      end.map(&:join)
      @queue.empty? ? self : map_with_threads { |x| yield(x) }
   end

   def queue_threads
      @queue = Queue.new
      until self.empty?
         work = self.pop
         @queue.push(work)
      end
   end

end


