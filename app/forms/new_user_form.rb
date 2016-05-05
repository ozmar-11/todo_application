class NewUserForm
  include ActiveModel::Model
  include Virtus.model
  include Rails.application.routes.url_helpers

  attribute :user_id
  attribute :user_name

  validates :user_name, presence: true

  attr_accessor :user

  def initialize(attrs = {}, user: nil)
    self.user = user||User.new
    self.user_name = user.user_name
    super(attrs)
  end

  def method
    return :put if user.persisted?
    :post
  end

  def action
    return user_path(user) if user.persisted?
    users_path
  end

  def save
    if valid?
      persist!
    else
      return false
    end
  end

  def persist!
    self.user = User.new
    self.user.user_id = user_id
    self.user.user_name = user_name
    self.user.save!
  end

end
