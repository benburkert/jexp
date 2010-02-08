class Array
  def to_jexp
    map {|v| JEXP.jexp(v) }
  end
end
