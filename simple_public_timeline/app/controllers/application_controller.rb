#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper ApplicationHelper

  protect_from_forgery with: :exception
  before_filter(:setup)
  rescue_from(Exception, with: :handle_error)

  attr_accessor :current_locale
  helper_method :current_locale

  def default_locale
    "en"
  end

  private
    def setup
      @current_locale = params.fetch(:locale, default_locale)
    end

    def handle_error(exception = nil)
      @error = exception

      if @error then
        if @error.is_a?(Lazier::Exceptions::Debug) then
          @error_title = "Debug"
          @error_code = 503
        else
          @error_title = "Error - #{@error.class.to_s}"
          @error_code = 500
        end
      end

      if request.xhr?
        render(json: {status: @error_code, error: @error.message}, status: @error_code)
      else
        render(nil, status: @error_code, layout: "error", formats: [:html])
      end
    end
end
