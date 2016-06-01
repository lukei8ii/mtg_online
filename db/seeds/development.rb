card_seed_file = Rails.root.join('db', 'seeds', 'ORI.json')
# card_seed_file = ''
cards = {}

if File.file?(card_seed_file)
  puts "Loading cards: #{card_seed_file}"
  file = File.read(card_seed_file)
  data = JSON.parse(file)
  cards = data['cards']
end

cards.each do |card_json|
  colors, types, subtypes = []

  if card_json['colors']
    colors = card_json['colors'].map do |name|
      Color.find_or_create_by({
        name: name
      })
    end
  end

  if card_json['types']
    types = card_json['types'].map do |name|
      Type.find_or_create_by({
        name: name
      })
    end
  end

  if card_json['subtypes']
    subtypes = card_json['subtypes'].map do |name|
      Subtype.find_or_create_by({
        name: name
      })
    end
  end

  begin
    Card.find_or_create_by(name: card_json['name']) do |card|
      card.cmc = card_json['cmc']
      card.flavor = card_json['flavor']
      card.image_name = card_json['imageName']
      card.layout = card_json['layout']
      card.mana_cost = card_json['manaCost']
      card.multiverse_id = card_json['multiverseid']
      card.number = card_json['number']
      card.power = card_json['power']
      card.rarity = card_json['rarity']
      card.text = card_json['text']
      card.card_type = card_json['type']
      card.colors = colors if colors
      card.types = types if types
      card.subtypes = subtypes if subtypes
    end
  rescue
    byebug
  end
end

Dir.glob(Rails.root.join('db', 'seeds', '*.txt')).each do |deck_file_name|
  file = File.new(deck_file_name)
  name = File.basename(file, '.*')
  deck = Deck.find_or_create_by(name: name)

  file.read.each_line do |line|
    line_contents = line.strip.split(' ', 2)
    card = Card.find_by(name: line_contents.last)

    if card
      DeckCard.find_or_create_by(deck: deck, card: card) do |deck_card|
        deck_card.amount = line_contents.first.to_i
      end
    end
  end
end

User.find_or_create_by(email: 'shea.hunter@gmail.com') do |user|
  user.name = 'Shea'
  user.password = '123456'
  user.password_confirmation = '123456'
end

User.find_or_create_by(email: 'tomtux@gmail.com') do |user|
  user.name = 'Thomas'
  user.password = '123456'
  user.password_confirmation = '123456'
end
