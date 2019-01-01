class Image < ApplicationRecord
  before_create :randomize_id

  belongs_to :user
  belongs_to :imageable, polymorphic: true

  validates :url,
    presence: true,
    length: {
      in: 1..200
    }  

  validates :width,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 12,
      less_than_or_equal_to: 5000,
    }

  validates :height,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 12,
      less_than_or_equal_to: 5000,
    }

  validates :user,
    presence: true

  validates :imageable,
    presence: true

  validates :imageable_type,
    presence: true,
    inclusion: { in: ['User'] }

  def size
    return self.width.to_s + 'x' + self.height.to_s
  end

  def thumbnail_url
    return self.url.split('.').map.with_index{|x,i| i==self.url.split('.').size-2 ? x+'_thumbnail' : x }.join('.')
  end

  #paginates_per 24 # 3 * 4 の倍数

  private
    def randomize_id
      begin
        r = [*0..9].tap { |x| break 8.times.map { x.sample }.join }
        self.id = Time.now.to_i.to_s + r
      end while Image.where(id: self.id).exists?
    end

end
