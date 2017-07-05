class Post < ActiveRecord::Base
    belongs_to :user

    serialize :tags, Array
    serialize :extdata, Array

    def tags=(x)
        write_attribute(:tags, x.split(/ *, */))
    end

    def extdata=(x)
        write_attribute(:extdata, x.split(/ *, */))
    end
end
