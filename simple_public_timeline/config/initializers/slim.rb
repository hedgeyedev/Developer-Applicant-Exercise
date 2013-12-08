#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

Slim::Engine.set_default_options(
  shortcut: {"#" => {attr: "id"}, "." => {attr: "class"}, "@" => {attr: "data-role"}},
  pretty: true, sort_attrs: true, tabsize: 2
)