class Post < ActiveRecord::Base

  paginates_per 25

  has_many :comments
  after_commit :invalidate_all_cache_key

  @@all_cache_key = Time.now.to_s

  def self.cached_all
    Rails.cache.fetch(['Post', @@all_cache_key]) { self.all }
  end

  def comments_with_replies
    Rails.cache.fetch([self, 'comments_with_replies']) { comments.preload(:replies) }
  end

  private

  def invalidate_all_cache_key
    @@all_cache_key = Time.now.to_s
  end

end
