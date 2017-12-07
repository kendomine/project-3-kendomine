class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper
  include SessionsHelper
  include EntriesHelper
  include ProfilesHelper

end
