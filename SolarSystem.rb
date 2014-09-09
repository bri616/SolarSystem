class SolarSystem
  attr_accessor :planets, :formation_year

  def initialize(planets_array, formation_year=1900)
    @formation_year = formation_year
    @planets = []
    planets_array.each {|planet_hash| add_planet(planet_hash)}
    planets.each {|planet| calc_planet_local_year(planet)}
  end

  def add_planet(planet_hash)
    @planets << Planet.new(planet_hash)
  end

  def calc_planet_local_year(planet, current_year=2014)
    planet.calc_local_year(@formation_year, current_year)
  end

  def distance_between(planet1, planet2)
    (planet1.distance_from_the_sun - planet2.distance_from_the_sun).abs
  end

  class Planet
    attr_accessor :name, :diameter, :mass, :moons, :rotation_rate, :local_year, :distance_from_the_sun

    def initialize(planet_hash)
      @name = planet_hash[:name]
      @diameter = planet_hash[:diameter]
      @mass = planet_hash[:mass]
      @moons = []
      planet_hash[:moons].each {|moon_hash| add_moon(moon_hash)}
      @rotation_rate = planet_hash[:rotation_rate]
      @local_year = local_year
      @distance_from_the_sun = planet_hash[:distance_from_the_sun]
    end

    def calc_local_year(solar_system_formation_year, current_year=2014)
      @local_year = ((((current_year-solar_system_formation_year)*365)).to_f/@rotation_rate).to_i
    end

    def add_moon(moon_hash)
      @moons << Moon.new(moon_hash)
    end

    class Moon
      attr_accessor :name, :diameter, :mass

      def initialize(moon_hash)
        @name = moon_hash[:name]
        @diameter = moon_hash[:diameter]
        @mass = moon_hash[:mass]
      end
    end
  end
end
