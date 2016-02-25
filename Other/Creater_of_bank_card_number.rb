module StorageIIN
  INNS = [
    {"American Express" => {inn_round: [34, 37], length: 15}},
    {"China UnionPay" => {inn_round: [62], length: 16}},
    {"Diners Club Carte Blanche" => {inn_round:	[(300..305)], length:	14}},
    {"Diners Club International" => {inn_round:	[309, 36, 38, 39], length: 14}},
    {"Diners Club United States & Canada" => {inn_round: [54, 55], length: 16}},
    {"Discover Card" => {inn_round: [6011, (622126..622925), (644..649), 65], length: 16}},
    {"InterPaymentTM" => {inn_round: [636], length: 16}},
    {"InstaPayment" => {inn_round: [(637..639)], length: 16}},
    {"JCB" => {inn_round: [(3528..3589)], length: 16}},
    {"Maestro" => {inn_round: [50, (56..69)], length: 12}},
    {"Dankort" => { inn_round: [5019], length: 16}},
    {"MasterCard" => {inn_round: [(51..55)], length: 16}},
    {"Visa" => {inn_round: [4], length: 13}},
    {"UATP" => {inn_round: [1], length: 15}},
    {"Verve" => {inn_round: [(506099..506198), (650002..650027)], length: 16}}
  ]
end

module Validity
  VALIDITY = 2

  private

  def add_validity
    time = Time.now.to_a
    "#{time[4]}/#{time[5] + VALIDITY}"
  end
end

module Outputer
  MESSAGES = {
    show_card: "{{issuing}}, number: {{num_card}}, {{validity}}"
  }

  private

  def display(key, values)
    return unless MESSAGES.has_key?(key)
    msg = MESSAGES[key]
    values.each do |k, v|
      msg = msg.gsub(Regexp.new('\{\{' + k.to_s + '\}\}'), v.to_s)
    end
    puts msg
  end
end

class CreaterRandomBankCard
  include StorageIIN
  include Validity
  include Outputer

  private

  def create_rand_card
    rand_inn = get_rand_issuing_network
    inn_round, length_card =  rand_inn.values[0][:inn_round], rand_inn.values[0][:length]
    num_rand_card = create_rand_num_card(inn_round, length_card)
    random_bank_card = {}
    random_bank_card[:issuing] = rand_inn.keys.join
    random_bank_card[:num_card] = num_rand_card
    random_bank_card[:validity] = add_validity
    random_bank_card
  end

  def get_rand_issuing_network
    INNS[rand(INNS.size)]
  end

  def create_rand_num_card(inn_round, length_card)
    rand_inn_num = get_random_inn_card(inn_round)
    num_card = rand_inn_num.to_s
    (length_card - rand_inn_num.to_s.size).times do
      num_card << rand(9).to_s
    end
    num_card
  end

  def get_random_inn_card(inn_round)
    if inn_round.size == 1
      if inn_round[0].class.to_s == "Range"
        rnd = Random.new
        rnd.rand(inn_round[0])
      else
        inn_round[0]
      end
    else
      index_inn = rand(inn_round.size - 1)
      if inn_round[index_inn].class.to_s == "Range"
        rnd = Random.new
        rnd.rand(inn_round[0])
      else
        inn_round[0]
      end
    end
  end
end

class CreaterSetRandomCards < CreaterRandomBankCard
  attr_reader :set_cards

  def initialize(amount_cards)
    @amount_cards = amount_cards.to_i
    @set_cards = create_set_cards
  end

  def show_set_cards
    set_cards.each do |k, v|
      #puts "#{k},,, #{v}"
      v[:num_card] = split_num_card(v[:num_card])
      display(:show_card, v)
    end
  end

  private

  def split_num_card(num_card)
    if num_card.size % 2 == 0
      num_card = num_card[0...num_card.size/2] + "-" + num_card[num_card.size/2..-1]
    else
      num_card = num_card[0...num_card.size/3]+ "-" + num_card[num_card.size/3...num_card.size/3*2] + "-" + num_card[num_card.size/3*2..-1]
    end
  end

  def create_set_cards
    serial_number = 1
    check_list = []
    set_cards = {}
    set_cards[serial_number] = create_rand_card
    check_list.push(set_cards[serial_number][:issuing])
    until @amount_cards == set_cards.size
      serial_number += 1
      card_to_check = create_rand_card
      unless check_list.include?(card_to_check[:issuing])
        check_list.push(card_to_check[:issuing])
        set_cards[serial_number] = card_to_check
      else
        serial_number -= 1
      end
    end
    set_cards
  end
end

my_card = CreaterSetRandomCards.new(10)
my_card.show_set_cards
