class SearchService
  attr_accessor :form, :search

  def initialize(search_form)
    self.form = search_form
    self.search = User.all
  end

  def search!
    filter_name if form.user_name.present?
    search
  end

  private

  def filter_name
    self.search = search.where('users.user_name like ?',"%#{ form.user_name.presence}%")
  end
end
