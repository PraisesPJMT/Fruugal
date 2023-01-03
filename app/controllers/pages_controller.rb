class PagesController < ApplicationController
  def splash
    return unless current_user

    redirect_to user_url(current_user)
  end
end
