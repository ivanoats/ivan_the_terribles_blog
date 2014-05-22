class Post < ActiveRecord::Base
  has_many :comments

  after_commit :invalidate_all_cache_key

  @@all_cache_key = Time.now.to_s

  def invalidate_all_cache_key
    @@all_cache_key = Time.now.to_s
  end

  def self.cached_all
    Rails.cache.fetch([self, @@all_cache_key]) { self.all }
  end


  def comments_with_replies
    comments.preload(:replies)
  end

end
