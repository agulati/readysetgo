REDIS_CONFIG = YAML.load_file(File.join(Rails.root, "config", "redis.yml"))[Rails.env.to_s]

Redis.current = Redis.new(
  host:     REDIS_CONFIG["server"],
  port:     REDIS_CONFIG["port"],
  password: REDIS_CONFIG["password"],
  timeout: 10
)

$redis = Redis::Namespace.new(:readysetgo, redis: Redis.current)
