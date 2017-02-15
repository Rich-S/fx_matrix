class CacheManager

   $redis = Redis.new

   def self.store(data)
      $redis.set(Date.today.to_s, check_redis << data)
   end
   
   def self.check_redis
      cache = $redis.get(Date.today.to_s)
      cache.is_a?(String) ? cache = eval(cache) : []        
   end 

   def self.lookback(pd)
      check_redis[-pd]
   end
   
end
