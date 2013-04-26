#!/usr/bin/env ruby

require 'net/https'
require 'openssl'
require 'json'

require 'yaml'

#OpenSSL::SSL.module_eval{ remove_const(:VERIFY_PEER) }
#OpenSSL::SSL.const_set( :VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE )

config = YAML.load_file('config.yml')

http = Net::HTTP::Proxy(config['proxy']['ip'],
                 config['proxy']['port'],
                 config['proxy']['user'],
                 config['proxy']['password']).new('api.github.com', 443)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
http.start {|c|
  res = c.get('/users/chiroru/repos')
  @b = JSON.parse(res.body)
}

@b.each {|b|
  p b['name']
}
