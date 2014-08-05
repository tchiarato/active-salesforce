require "active_salesforce/version"
require "databasedotcom"

module ActiveSalesforce
    class Base

        attr_reader :state

        def initialize config

            @client = Databasedotcom::Client.new config

            begin
                @client.authenticate :username => config[:username], :password => config[:password]
                @state = :connected
            rescue
                @state = :disconnected
            end
        end

        def user_id
            @client.user_id
        end

        def method_missing(method, *args, &block)
            super unless method.to_s =~ /^create_(.*)$/
            create method
        end

        def self.respond_to?(method, include_private = false)
            if method.to_s =~ /^create_(.*)$/
                true
            else
                super
            end
        end

        def self.map(from, to: "")

            @fields ||= {}
            @fields[to] = from

            get = %Q{
                def #{from}
                    @#{from}
                end
            }

            set = %Q{
                def #{from}=(value)
                    @#{from} = value
                end
            }

            self.class_eval get
            self.class_eval set
        end

        private

        def create(method)
            modelName = method.to_s.split("_").map(&:capitalize).last

            @client.sobject_module = "ActiveSalesforce"
            @client.materialize modelName
            self.class.create modelName, self
        end

        def self.create(modelName, obj)

            model = ActiveSalesforce.const_get(modelName).new

            @fields.each do |key, value|
                value = obj.instance_variable_get("@#{value}")
                model.instance_variable_set("@#{key}", value)
            end

            begin
                model.save
                :success
            rescue Exception => e
                :error
            end
        end
    end
end