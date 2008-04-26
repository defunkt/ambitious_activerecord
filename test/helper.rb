%w( rubygems test/spec mocha redgreen English ).each { |f| require f }

$LOAD_PATH.unshift *[ File.dirname(__FILE__) + '/../lib', File.dirname(__FILE__) + '/../../../lib' ]
require 'ambition/adapters/active_record'

class User < ActiveRecord::Base 
  def self.reflections
    return @reflections if @reflections
    @reflections = {}
    @reflections[:ideas]    = Reflection.new(:has_many,   'user_id',     :ideas,   'ideas')
    @reflections[:invites]  = Reflection.new(:has_many,   'referrer_id', :invites, 'invites')
    @reflections[:profile]  = Reflection.new(:has_one,    'user_id',     :profile, 'profiles')
    @reflections[:account]  = Reflection.new(:belongs_to, 'account_id',  :account, 'accounts')
    @reflections
  end

  def self.table_name
    'users'
  end
end

class Reflection < Struct.new(:macro, :primary_key_name, :name, :table_name)
end

module ActiveRecord
  module ConnectionAdapters
    class MysqlAdapter  
      def initialize(*args)
        super
      end

      def connect(*args)
        true
      end
    end

    class PostgreSQLAdapter  
      def connect(*args)
        true
      end
      class PGError; end
    end

    class FakeAdapter < AbstractAdapter
    end
  end
end
