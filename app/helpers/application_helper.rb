module ApplicationHelper

  def current_player
    @current_player ||= current_user
  end
end
