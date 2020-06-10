class ApplicationController < ActionController::Base
  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder
  before_action :populate_user_from_session!

private

  def populate_user_from_session!
    @user = User.find(session[:user_id]) if session[:user_id].present?
    @user ||= User.new
  end

  def save_user_to_session!(user = @user)
    session[:user_id] ||= user.id if user.present?
  end
end
