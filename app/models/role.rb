class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map{|audition| audition.actor}
    end

    def locations
        self.auditions.map{|audition| audition.location}
    end

    def lead
        hire=self.auditions.find{|audition| audition.hired}
        hire ? hire : "no actor has been hired for this role"
    end

    def understudy
        hires=self.auditions.filter{|audition| audition.hired}
        hires[1] ? hires[1] : "no actor has been hired understudy for this role"
    end
end