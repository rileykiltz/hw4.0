class User < ApplicationRecord
  has_many :entries

  before_save :hash_password

  private

  def hash_password
    self.password = BCrypt::Password.create(password)
  end
end