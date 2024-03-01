class UsersController < ApplicationController

  def timeline
    @users = UserFacade.new.user_posts
  end
end