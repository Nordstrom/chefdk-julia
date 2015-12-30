# Copyright 2015 Nordstrom, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require_relative 'lib/chefdk/julia/version'

# ChefDK requires this metadata file to be able to load Julia as a cookbook, even
# though Julia isn't a traditional cookbook that gets uploaded to Chef Server
# and run by nodes.

# We need to get the basename of the chefdk-julia dir in gems/, e.g. chefdk-julia-0.4.2,
# to make chef generate cookbook work. Otherwise we get this error:
# ERROR: Could not find cookbook(s) to satisfy run list ["recipe[chefdk-julia-0.4.2::cookbook]"
# See https://github.com/chef/chef-dk/issues/633
name File.basename(File.dirname(__FILE__))

description 'An Opinionated Cookbook Creator'
long_description 'An Opinionated Cookbook Creator, with spunk and a grin, by Nordstrom'

version Chefdk::Julia::VERSION
