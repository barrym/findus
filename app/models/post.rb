class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :category


  def as_json(options = {})
    super.merge({
      :username => self.user.username
    })
  end

end
