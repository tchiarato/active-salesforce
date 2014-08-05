require 'spec_helper'
require 'yaml'

describe Lead do

    before :each do
        @config = YAML.load_file("lib/active_salesforce/example/config/salesforce.yml")
        
        @lead = Lead.new @config["resultados_digitais"]
    end

    describe "#new" do
        it "takes one parameter and return an instance of Lead" do
            expect(@lead).to be_an_instance_of Lead
        end

        it "inherits from Salesforce" do
            expect(@lead).to be_a_kind_of ActiveSalesforce::Base
        end
    end

    describe "#connect" do
        it "has property state with value of :connected" do
            expect(@lead.state).to be :connected
        end
    end

    describe "#map" do
        it "has property firstName" do
            expect(@lead).to respond_to :firstName
        end

        it "set value foo from firstName" do
            @lead.firstName = "foo"
            expect(@lead.firstName).to be_eql "foo"
        end
    end

    describe "#createLead" do
        it "has method create_lead" do
            expect(Lead).to respond_to :create_lead
        end

        it "return success after creating a Lead" do
            
            @lead.firstName = "Thiago"
            @lead.lastName = "Dutra"
            @lead.company = "Resultados Digitais"
            @lead.email = "thiago.chiarato@hotmail.com"
            @lead.job_title = "Developer"
            @lead.phone = "+55 43 8828-6906"
            @lead.website = "http://www.google.com.br"

            expect(@lead.create_lead).to be_eql :success
        end
    end
end