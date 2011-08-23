SpreeZipZones
=============

Based off of extension spree-city-zones: https://github.com/niamtech/spree-city-zones.git

Adds ability to create zones based on zipcodes instead of cities.


Usage
=======

* Add gem 'spree_zip_zones', :git => 'git://github.com/Andrewmp1/spree-zip-zones.git'
* Run `bundle install`
* Run `bundle exec rake spree_zipcode_zones:install`
* Run `bundle exec rake db:migrate`

Then you can add zipcodes like states, and associate them into zones.
Does not support city/state inheritance.


Copyright (c) 2011 PrintBear, LLC. released under the New BSD License
