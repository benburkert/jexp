module JEXP
  module Model
    def new(attrs = {})
      sattrs = attrs.inject({}) {|h,(k,v)| h.update(k.to_s => v) }
      super(*members.map {|m| sattrs.delete(m) })
    end
  end
end
