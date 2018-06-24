class User < ApplicationRecord
   attr_accessor :remember_token
   has_many :posts, dependent: :destroy #associated posts should be destroyed
   before_save { self.email = email.downcase } #強制小文字化

   validates :name,  presence: true,
                      length: { maximum: 50 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #正規表現フォーマット

   validates :email, presence: true,
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true,
                          length: { minimum: 6 },
                          allow_nil: true

# 渡された文字列のハッシュ値を返す
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # 試作feedの定義
  def feed
    Post.where("user_id = ?", id)
  end

  # ランダムなトークンを返す
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
   def remember
     self.remember_token = User.new_token
     update_attribute(:remember_digest, User.digest(remember_token)) #ハッシュ化→保存
   end

   # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token) #ローカル変数
    end

    # ユーザーのログイン情報を破棄する
    def forget
      update_attribute(:remember_digest, nil)
    end

end
