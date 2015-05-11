class Url < ActiveRecord::Base

  def self.find_by_path(path)

  end


  def self.top_100
  query = <<-SQL
    SELECT
      url, short, visits
    FROM
      urls
    ORDER BY
      visits DESC
    LIMIT 100

    SQL

    Url.find_by_sql(query)
  end

  def url
    self[:url]
  end

  def add_visit
    self[:visits] += 1
    self.save!
  end

  def self.shorten(id)
    special = "$-_+!*'(),".split("")
    chars = special.concat(('a'..'z').to_a).concat(('A'..'Z').to_a).concat(('0'..'9').to_a)
    indices = []
    num = id.to_i
    while num > 0
      remainder = num % 72
      indices.push(remainder)
      num = num / 72
    end
    indices.reverse!
    short = indices.map {|idx| chars[idx]}.join
  end


end
