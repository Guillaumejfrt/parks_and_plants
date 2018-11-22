class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true

  # custom method to validate that image_url is a url
  validate :image_url_https

  private

  def image_url_https
    unless image_url.include?('http://') || image_url.include?('https://')
      errors.add(
        :image_url, "must be a url"
      )
    end
  end
end
