class Cult
    @@all = []
    attr_reader :name, :location, :founding_year, :slogan

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @followers = []
        save
    end
    def recruit_follower(follower)
        BloodOath.new(self, follower)
        @followers.push(follower)
    end
    def cult_population
        @followers.count
    end
    def self.find_by_name(cult_name)
        Cult.all.find {|cult| cult.name == cult_name}
    end
    def self.find_by_location(cult_location)
        Cult.all.find {|cult| cult.location == cult_location}
    end
    def self.find_by_founding_year(cult_year)
        Cult.all.find{|cult| cult.founding_year == cult_year}
    end
    def average_age
        total = 0
        @followers.each {|follower| total += follower.age}
        average = total / self.cult_population
    end
    def my_followers_mottos
        @followers.each {|follower| puts follower.life_motto}
    end
    def self.least_popular
        population = Cult.all[0].cult_population
        lowest = Cult.all[0]
        Cult.all.each do |cult|
            # binding.pry
            if cult.cult_population < population
                population = cult.cult_population
                lowest = cult
            end
        end
        lowest    
    end
    def self.most_common_location
        loc_array = []
        Cult.all.each {|cult| loc_array.push(cult.location)}
        loc_count_hash = Hash.new(0)
        loc_array.each do |loc|
            loc_count_hash[loc] += 1
        end
        count = 0
        max_array = loc_count_hash.max_by {|loc, count| count}
        max_name = max_array[0]    
    end

    def save
        @@all.push(self)
    end
    def self.all
        @@all
    end
end

