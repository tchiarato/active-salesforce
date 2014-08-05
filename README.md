# ActiveSalesforce

ActiveSalesforce uses databasedotcom gem to wrap the communication with salesforce and contributes to simplify the creation of objects (Lead) in salesforce.


## Installation

Add this line to your application's Gemfile:

    gem 'active_salesforce'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_salesforce

## Usage

1. Create a class and inherit from ActiveSalesforce::Base
2. Map the local attributes to salesforce attributes (you will find an example at https://github.com/tchiarato/rd-salesforce)
3. Create config files to store salesforce's configurations
4. Invoke create_lead to create a new lead at salesforce. 

## Contributing

1. Fork it ( https://github.com/[my-github-username]/active_salesforce/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
