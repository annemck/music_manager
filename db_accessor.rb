require('pg')

class DataAccessor
  def DataAccessor.run(sql, values = [])
    begin
      db = PG.connect(dbname: 'music_manager', host: 'localhost')
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close()
    end
    return result
  end
end
