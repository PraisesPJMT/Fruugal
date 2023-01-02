class PagesController < ApplicationController
  def splash
    if current_user
      redirect_to user_url(current_user)
    end
  end
end
