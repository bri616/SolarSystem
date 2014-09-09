class SolarSystem
  attr_accessor :planets, :formation_date

  def initialize(planets, formation_date=1900)
    @formation_date = formation_date
    @planets = []
    planets.each {|planet_hash| add_planet(planet_hash)}
  end

  def add_planet(planet_hash)
    @planets << Planet.new(planet_hash)
  end

  class Planet
    attr_accessor :name, :diameter, :mass, :moons, :rotation_rate, :local_year

    def initialize(planet_hash)
      @name = planet_hash[:name]
      @diameter = planet_hash[:diameter]
      @mass = planet_hash[:mass]
      @moons = []
      planet_hash[:moons].each {|moon_hash| add_moon(moon_hash)}
      @rotation_rate = planet_hash[:rotation_rate]
      @local_year = calc_local_year
    end

    def calc_local_year
      0
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

#planets
cascade = {
  name: "Cascade",
  diameter: 50,
  mass: 800,
  moons: [citra, centenniel],
  rotation_rate: 10
}

simcoe = {
  name: "Simcoe",
  diameter: 80,
  mass: 1200,
  moons: [goldings],
  rotation_rate: 30
}

#moons
citra = {
  name: "Citra",
  diameter: 5,
  mass: 20
}

centenniel = {
  name: "Centenniel",
  diameter: 2,
  mass: 10
}

goldings = {
  name: "Goldings",
  diameter: 12,
  mass: 100
}
