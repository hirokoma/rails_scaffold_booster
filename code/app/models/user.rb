class User < ApplicationRecord
  before_create :randomize_id
  after_create :create_image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]


  has_one :image, as: :imageable


  def self.from_twitter(auth)
    find_or_create_by(provider: auth['provider'], uid: auth['uid']) do |user|
      puts auth['info']
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.nickname = auth['info']['nickname']
    end
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes']) do |user|
        user.attributes = params
      end
    else
      super
    end
  end


  private
    def randomize_id
      begin
        r = [*0..9].tap { |x| break 8.times.map { x.sample }.join }
        self.id = Time.now.to_i.to_s + r
      end while User.where(id: self.id).exists?
    end

    def create_image
      image = Image.new({
        user_id: self.id,
        imageable_id: self.id,
        imageable_type: 'User'
      })
      image.save!
    end
end