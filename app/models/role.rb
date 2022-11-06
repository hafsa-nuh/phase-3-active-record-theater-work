class Role < ActiveRecord::Base
    has_many :auditions
    def auditions
        self.audtions
    end 

    def actors
        self.auditions.map do |name|
            name.actor
        end
    end

    def locations
        self.auditions.map do |locations|
            locations.location
        end
    end

    def lead
        self.auditions.select do |role|
            role.hired 
        end.map do |all|  
            if all.hired == true
                all
            else  
                "no actor has been hired for this role"
            end  
        end.first 
    end

    def understudy
        self.auditions.select do |audition|
            audition.hired 
        end.map do |all|  
            if all.hired == true
                all
            else  
                "no actor has been hired for understudy for this role"
            end  
        end.second
    end
end