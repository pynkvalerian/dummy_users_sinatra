class Url < ActiveRecord::Base
  # Remember to create a migration!
  attr_accessor :user_id

  belongs_to :user

  validates_format_of :long_url, with: URI.regexp(['http', 'https'])

  def self.generate_short_url
      @shortened_url = ('a'..'z').to_a.shuffle[0,5].join
  end

  def self.get_url(short_url)
    link = self.find_by shortened_url: short_url
    link.click_count = link.click_count + 1
    link.save
    link.long_url
  end

end