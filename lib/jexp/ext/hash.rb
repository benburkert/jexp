class Hash
  def to_jexp
    inject(self::class.new) do |h, (key, value)|
      h.update key.to_s => JEXP.jexp(value)
    end
  end
end
