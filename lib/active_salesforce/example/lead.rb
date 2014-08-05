require_relative "../../active_salesforce"

class Lead < ActiveSalesforce::Base

    map :firstName      ,to: :FirstName
    map :lastName       ,to: :LastName
    map :company        ,to: :Company
    map :email          ,to: :Email
    map :job_title      ,to: :Title
    map :phone          ,to: :Phone
    map :website        ,to: :Website
    map :owner          ,to: :OwnerId
    map :isConverted    ,to: :IsConverted
    map :isUnreadByOwner,to: :IsUnreadByOwner

    def initialize config
        super config

        @owner = user_id
        @isConverted = false
        @isUnreadByOwner = false
    end
end