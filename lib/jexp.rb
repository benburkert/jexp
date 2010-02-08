require 'json'
require 'forwardable'

module JEXP
  def self.jexp(*a)
    return *a.map {|o| o.respond_to?(:to_jexp) ? o.to_jexp : JSON.parse(JSON.dump([o])).first }
  end
end

require 'jexp/ext/array'
require 'jexp/ext/hash'
require 'jexp/ext/integer'
require 'jexp/ext/string'
require 'jexp/model'
require 'jexp/resource'
