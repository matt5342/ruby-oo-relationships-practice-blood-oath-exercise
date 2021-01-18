
class BloodOath
    @@all = []
    @@first = []
    attr_reader :initiation_date, :follower, :cult
    def initialize(cult, follower)
        @initiation_date = Date.today.to_s
        @cult = cult
        @follower = follower
        @@first.length == 0 ? @@first.push(follower) :
        save
    end
    def self.first_oath
        @@first[0]
    end
    def save
        @@all.push(self)
    end
    def self.all
        @@all
    end
end