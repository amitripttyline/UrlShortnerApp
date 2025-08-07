

# app/models/short_url.rb
class ShortUrl < ApplicationRecord
  validates :original_url, presence: true
  validates :short_code, uniqueness: true
  before_create :generate_short_code
  before_create { self.clicks = 0 }

  private

  def generate_short_code
    begin
      self.short_code = SecureRandom.urlsafe_base64(4)
    end while ShortUrl.exists?(short_code: self.short_code)
  end
end
