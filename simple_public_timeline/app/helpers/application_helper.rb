#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

module ApplicationHelper
  def browser
    @browser ||= Brauser::Browser.new(request.user_agent)
  end

  def browser_supported?(conf_file = nil)
    browser.supported?(conf_file || (Rails.root + "config/supported-browsers.yml").to_s)
  end

  def scope_css
    "%s %s" % [controller_path.gsub("/", "-"), action_name]
  end

  def sending_form?
    request.post? || request.put?
  end
end