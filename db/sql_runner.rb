require('pg')
require_relative('../models/noun.rb')

class SqlRunner

  def self.run(sql, values = [])
    db = PG.connect({dbname: 'romanian_vocabulary', host: 'localhost'})
    db.prepare("query", sql)
    result = db.exec_prepared("query", values)

    db.close
    return result
  end

end
