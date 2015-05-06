class Url < ActiveRecord::Base

  def self.find_by_path(path)

  end

  def self.shorten(id)
    chars = ('a'..'z').to_a.concat(('A'..'Z').to_a).concat(('0'..'9').to_a)
    indices = []
    num = id.to_i
    while num > 0
      remainder = num % 62
      indices.push(remainder)
      num = num / 62
    end
    indices.reverse!
    short = indices.map {|idx| chars[idx]}.join
  end

end
