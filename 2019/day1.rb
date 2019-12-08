def fuel_total
    total = 0

    File.open('day1input.txt').each do |line|
        mass = line.to_i

        fuel = added_fuel mass

        total += fuel
    end

    return total
end

def added_fuel(fuel_mass)
    return 0 if fuel_mass <= 8

    fuel = fuel_mass/3-2

    fuel += added_fuel fuel

    return fuel
end

puts "fuel: #{fuel_total}"
