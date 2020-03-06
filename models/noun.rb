require('pg')
require_relative('../db/sql_runner.rb')

class Noun

  attr_reader :id, :english, :gender, :na_plu_indef, :na_sing_def, :na_plu_indef, :na_plu_def

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @english = options['english']
    @gender = options['gender']
    @na_sing_indef = options['na_sing_indef']
    @na_sing_def = options['na_sing_def']
    @na_plu_indef = options['na_plu_indef']
    @na_plu_def = options['na_plu_def']
  end

  def save()
    sql = "INSERT INTO nouns
             (english,
              gender,
              na_sing_indef,
              na_sing_def,
              na_plu_indef,
              na_plu_def)
            VALUES
            ($1, $2, $3, $4, $5, $6)
            RETURNING id"
    values = [@english,
              @gender,
              @na_sing_indef,
              @na_sing_def,
              @na_plu_indef,
              @na_plu_def]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i
  end

  def self.find_by_english(english)
    sql = "SELECT * FROM nouns
            WHERE english = $1"
    values = [english]

    english_hash = SqlRunner.run(sql, values).first()
    return Noun.new(english_hash)
  end

  def self.delete_all()
    sql = "DELETE FROM nouns"
    SqlRunner.run(sql)
  end

end
