#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

SimplePublicTimeline::Application.routes.draw do
  get("/via_js", to: "main#via_js")
  root(to: "main#index")
end