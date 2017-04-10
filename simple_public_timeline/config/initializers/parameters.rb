#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

Rails.application.config.filter_parameters += [:password]

ActiveSupport.on_load(:action_controller) do
  wrap_parameters(format: [:json]) if respond_to?(:wrap_parameters)
end