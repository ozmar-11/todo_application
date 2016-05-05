class UsersController < ApplicationController
  expose(:user)
  expose(:users)
  expose(:user_form){ NewUserForm.new(user_params, user: user)}
  expose(:search_form){ SearchForm.new(search_params) }

  def index
      self.users = SearchService.new(search_form).search!
    end

  def create
    respond_to do |format|
      if user_form.save
        format.html { redirect_to user_form.user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: user_form.user }
      else
        format.html { render :new }
        format.json { render json: user_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if user_form.user.update(user_params)
        format.html { redirect_to user_form.user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: user_form.user }
      else
        format.html { render :edit }
        format.json { render json: user_form.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
      return {} unless params[:user].present?
      params.require(:user).permit(:user_name, :user_id)
  end

  def search_params
    return {} unless params[:search].present?
    params.require(:search)
  end
end
