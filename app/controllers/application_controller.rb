class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_action :play_with_logger

private

  #def log_event
    #obj_name = "@#{controller_name.singularize.underscore}"
    #LogEvent.log(1, instance_variable_get(obj_name), params[:action])
  #end

   def log_event(object)
    LogEvent.log(1, object, params[:action])
  end

  def play_with_logger
    logger.info "-------------> BEFORE"
    yield
    logger.info "AFTER <--------------"
  end


end
