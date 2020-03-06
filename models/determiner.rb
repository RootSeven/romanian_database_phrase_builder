require('pg')
require_relative('../db/sql_runner.rb')

class Determiner

  attr_reader :id, :english, :person, :masc_sing, :masc_plu, :fem_sing, :fem_plu

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @english = options['english']
    @person = options['person']
    @masc_sing = options['masc_sing']
    @masc_plu = options['masc_plu']
    @fem_sing = options['fem_sing']
    @fem_plu = options['fem_plu']
  end

  def save()
    sql = "INSERT INTO determiners
            (english,
             person,
             masc_sing,
             masc_plu,
             fem_sing,
             fem_plu)
            VALUES
            ($1, $2, $3, $4, $5, $6)
            RETURNING id"
    values = [@english, @person, @masc_sing, @masc_plu, @fem_sing, @fem_plu]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i
  end

  def self.find_by_english(english)
    sql = "SELECT * FROM determiners
            WHERE english = $1"
    values = [english]

    english_hash = SqlRunner.run(sql, values).first()
    return Determiner.new(english_hash)
  end

  def self.delete_all
    sql = "DELETE FROM determiners"
    SqlRunner.run(sql)
  end

end
