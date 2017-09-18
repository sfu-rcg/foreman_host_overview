# Foreman Host Overview

A Foreman plugin to extend what the properties table includes for a host.

## Installation

The foreman_host_overview gem requires Ruby 2.0.0 or higher.

Include this gem in one of your Gemfiles (ex: `foreman/bundler.d/Gemfile.local.rb`)

```ruby
gem 'foreman_host_overview', :git => "https://github.com/sfu-rcg/foreman_host_overview.git"
```

As the Foreman user:

```bash
bundle install
```

Restart the application:

```bash
# The passenger way
touch tmp/restart.txt
# The apache way
sudo apachectl graceful
# The nginx way
sudo /etc/init.d/nginx -s reload
```

### Upgrading

```bash
bundle update foreman_param_lookup
# Restart application
```

## Usage

Simply view a host's properties table. You should see two additional rows at the end

![Properties](/screenshots/properties.png?raw=true)

Through a tab in the Foreman's settings page, you can toggle whether or not you want this plugin to display non-native connection types for a host.

Although is possible to use the host ip address for building the connection links, instead of fqdn.

![Settings](/screenshots/settings.png?raw=true)

Native connections types:

|   OS    | Display    |
| ------- |----------- |
| Windows | RDP        |
| Linux   | VNC, & SSH |


## Contributing

Fork and send a Pull Request. Thanks!

## Copyright

Copyright (c) 2014 Simon Fraser University

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
