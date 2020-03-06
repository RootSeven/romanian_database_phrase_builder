require('pg')
require_relative('noun.rb')
require_relative('determiner.rb')

class PhraseBuilder

  def self.possessive_noun_phrase(noun, grammar_number, possessive_determiner)
    noun_object = Noun.find_by_english(noun)
    determiner_object = Determiner.find_by_english(possessive_determiner)

    if grammar_number == "singular"
      if noun_object.gender == 'feminin'
        puts "#{noun_object.na_sing_def} #{determiner_object.fem_sing}"
      else
        puts "#{noun_object.na_sing_def} #{determiner_object.masc_sing}"
      end
    elsif grammar_number == "plural"
      if noun_object.gender == 'masculin'
        puts "#{noun_object.na_plu_def} #{determiner_object.masc_plu}"
      else
        puts "#{noun_object.na_plu_def} #{determiner_object.fem_plu}"
      end
    end
  end

end
