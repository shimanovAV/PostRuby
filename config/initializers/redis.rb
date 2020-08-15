unless Rails.env.test?
  $redis = Redis::Namespace.new("site_point", :redis => Redis.new)
else
  $redis = Redis::Namespace.new(:my_namespace, redis: MockRedis.new )
end
