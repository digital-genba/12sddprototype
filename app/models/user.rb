class User < ActiveRecord::Base
    has_secure_password

    validates :password, length: {minimum: 8}

    has_many :posts
    has_many :sessions

    serialize :likes, Array
    serialize :dislikes, Array

    def to_param
        username
    end
    
    def likes=(x)
        write_attribute(:likes, x.split(/ *, */))
    end

    def dislikes=(x)
        write_attribute(:dislikes, x.split(/ *, */))
    end
end
