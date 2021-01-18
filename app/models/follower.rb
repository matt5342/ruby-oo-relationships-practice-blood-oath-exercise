class Follower
    @@all = []
    attr_reader :name, :age, :life_motto

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @cults = []
        save
    end
    def join_cult(cult)
        BloodOath.new(cult, self)
        @cults.push(cult)
    end
    def cults
        @cults.count
    end
    def self.of_a_certain_age(certain_age)
        Follower.all.select {|follower| follower.age >= certain_age}
    end
    def my_cults_slogans
        @cults.each {|cult| puts cult.slogan}
    end
    def self.most_active
        @new_all = @@all
        cult_count = Follower.@new_all[0].cults
        highest = Follower.@new_all[0]
        Follower.@new_all.each do |follower|
            # binding.pry
            if follower.cults > cult_count
                cult_count = follower.cults
                highest = follower
            end
        end
        highest    
    end
    def self.top_ten
        ten_most = []
        10.times {
            ten_most.push(Follower.most_active)
            @new_all.delete(Follower.most_active)
        }
        ten_most
    end
    end
    def save
        @@all.push(self)
    end
    def self.all
        @@all
    end
end