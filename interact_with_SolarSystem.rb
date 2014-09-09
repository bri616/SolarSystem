require "./SolarSystem.rb"

## Arrays of planets and moons here to generate solar system
## I can probably keep these in another file and grab them using
## a function in SolarSystem!

# moons
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

# planets
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

hops_planets = [cascade, simcoe]

hops_ss = SolarSystem.new(hops_planets)

puts "Hello, welcome to the Hops Solar System!"
while true
  puts "This Hops Solar System has the following planets:"
  hops_ss.planets.each {|planet| puts planet.name}

  while true
    puts "Which planet would you like to explore? (type 'q' to quit)"
    planet_name = gets.chomp.capitalize
    if (hops_ss.planets.collect {|planet| planet.name }).include? planet_name
      current_planet = hops_ss.planets.select {|planet| planet.name == planet_name}[0]
      break
    elsif planet_name == "Q"
      break
    end
    puts "That's not an option, try again."
  end

  if planet_name == "Q"
    break
  end

  while true
    puts "Here are all the attributes of #{current_planet.name}:"
    current_planet.instance_variables.each {|var| puts var.to_s[1..-1]}

    while true
      puts "Which attribute would you like to explore? (type 'q' to get back to planet selection)"
      attribute_name = gets.chomp.downcase
      if (current_planet.instance_variables.collect {|var| var.to_s[1..-1]}).include? attribute_name
        break
      elsif attribute_name == "q"
        break
      end
      puts "That's not an option, try again"
    end

    if attribute_name == "q"
      break
    end
    puts "The planet #{current_planet.name} contains the following information about "
    puts "#{attribute_name}:"
    puts current_planet.instance_eval(attribute_name)
  end

end
