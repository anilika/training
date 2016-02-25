module Outputter
  STATIC_MESSAGES = {
    start_game: "Welcome to the Numbers Game.\nType your number of players.\n",
    rules: "The computer thinks of a number from 0 to 9.
You need to guess. For every guessed number you get 1 point.
The winner is the first to score 3 points.\n",
    make_num: "The computer thinks of a new number.\n",
    win_round: "You guessed!",
    wrong: "Wrong!",
    play_again: "Play again? yes/no"
  }

  MESSAGES = {
    player_name: "Type a name for player {{num_player}}.",
    type_num: "Player {{player}}, type your number.\n",
    game_winner: "Congratulations to the {{player}}, he scored 3 points and won."
  }

  def display(key, values)
    return unless MESSAGES.has_key?(key)
    msg = MESSAGES[key]
    values.each do |k, v|
      msg = msg.gsub(Regexp.new('\{\{' + k.to_s + '\}\}'), v.to_s)
    end
    puts msg
  end

  def show(key)
    return unless STATIC_MESSAGES.has_key?(key)
    puts STATIC_MESSAGES[key]
  end
end

module Inputter

  def take
    value = nil
    until value
      value = gets.chomp
    end
    value
  end
end

class Rules
  RANGE_NUM = (0..9)

  def make_number
    rnd = Random.new
    rnd.rand(RANGE_NUM)
  end
end

class Game < Rules
  include Outputter
  include Inputter

  def initialize
    show(:start_game)
    @players = {}
    @players_num = take.to_i
    @computer_num = nil
    @winner = 0
    new_game
  end

  def new_game
    show(:rules)
    set_playes_names
    loop do
      if new_round == "no"
        break
      else
        @winner = 0
      end
    end
  end

  def new_round
    while @winner == 0
      computer_num = make_number.to_i
      show(:make_num)
      players_move(computer_num)
    end
    display(:game_winner, player: @players[@winner].name)
    show(:play_again)
    take
  end

  def players_move(computer_num)
    player_num = nil
    until computer_num == player_num
      (1..@players_num).each do |player|
        display(:type_num, player: @players[player].name)
        player_num = take.to_i
        if player_num == computer_num
          @players[player].points += 1
          show(:win_round)
          @winner = player if @players[player].points == 3
          break
        else
          show(:wrong)
        end
      end
    end
  end


  def set_playes_names
    (1..@players_num).each do |player|
      display(:player_name, num_player: player)
      @players[player] = Player.new(take)
    end
  end

  class Player
    attr_accessor :num, :points, :player_num
    attr_reader :name

    def initialize(name)
      @name = name
      @points = 0
    end
  end
end

my_game = Game.new
