credentials =  YAML.load_file("#{Rails.root}/config/redis.yml")[Rails.env]
$redis = Redis.new(credentials.symbolize_keys!) if credentials
