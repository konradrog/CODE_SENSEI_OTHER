class Pokemon
  attr_accessor :name, :type, :health, :attack

  def initialize(name, type, health, attack)
    @level = 50
    @name = name
    @type = type
    @health = health
    @attack = attack


  end

  def calculate_health #to do zmiany, bo się liczy przy każdym wywolaniu funkcji od nowa
    @health = @health * @level
  end

  def calculate_attack
    modifier = [-1, 1]
    attack_m = @attack*10 + rand(7)*modifier[rand(2)]
  end
end

class Battle
  attr_accessor :contender1, :contender2
  def initialize(contender1, contender2)
    @contender1 = contender1
    @contender2 = contender2
    @health1 = contender1.calculate_health
    @health2 = contender2.calculate_health
  end

  def attack_c1
    @contender1.calculate_attack
  end

  def attack_c2
    @contender2.calculate_attack
  end

  def round
    puts "#{@contender1.name} current health: #{@health1}"
    puts "#{@contender2.name} current health:#{@health2}"
    ac2 = attack_c2
    ac1 = attack_c1
    @health1 -= ac2
    @health2 -= ac1
    puts
    puts "#{@contender1.name} deals #{ac2} damages to #{@contender2.name} "
    puts "#{@contender2.name} deals #{ac1} damages to #{@contender1.name} "

  end

  def match
    round_counter = 1

    while @health2 > 0 || @health1 > 0
      puts "__________ R0und n0. #{round_counter} ___________"
      puts
      round
      round_counter += 1
      gets
    end
    puts "_________GAME OVER_____________________"
    puts
    if @health2 > @health1
      puts "#{@contender2.name} WINS !!!!"
    else
      puts "#{@contender1.name} WINS !!!!"
    end
  end

end


puts "*************** WELCOME *******************"
puts "You chose two Pokémon's to fight. Let's begin!"
gets
pikachu = Pokemon.new("Pikachu", "electric", 100, 50)
charmander = Pokemon.new("Charmander", "fire", 100, 50)

Battle.new(pikachu,charmander).match
