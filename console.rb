require('pg')
require('pry')
require_relative('db/sql_runner')
require_relative('models/noun.rb')
require_relative('models/determiner.rb')
require_relative('models/phrase_builder.rb')

Noun.delete_all
Determiner.delete_all

# INSTANTIATE NOUNS
apple = Noun.new({'english' => 'apple',
                  'gender' => 'neutru',
                  'na_sing_indef' => 'măr',
                  'na_sing_def' => 'mărul',
                  'na_plu_indef' => 'mere',
                  'na_plu_def' => 'merele'})
apple.save()

goose = Noun.new({'english' => 'goose',
                  'gender' => 'feminin',
                  'na_sing_indef' => 'gâscă',
                  'na_sing_def' => 'gâsca',
                  'na_plu_indef' => 'gâște',
                  'na_plu_def' => 'gâștele'})
goose.save()

# INSTANTIATE DETERMINERS
my = Determiner.new({'english' => 'my',
                     'person' => 'first',
                     'masc_sing' => 'meu',
                     'masc_plu' => 'mei',
                     'fem_sing' => 'mea',
                     'fem_plu' => 'mele'})
my.save()

binding.pry
nil
