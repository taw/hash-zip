# Enumerable#zip is nonsense when applied to Hashes
class Hash
  def zip(*args)
    sources = [self]
    args.each do |arg|
      if arg.is_a?(Hash)
        sources << arg
      else
        sources << arg.to_h
      end
    end
    output_keys = sources.flat_map(&:keys).uniq
    if block_given?
      output_keys.each do |key|
        yield(key, *sources.map{|source| source[key]})
      end
      nil
    else
      result = {}
      output_keys.each do |key|
        result[key] = sources.map{|source| source[key]}
      end
      result
    end
  end

  def zip_compact(*args)
    sources = [self]
    args.each do |arg|
      if arg.is_a?(Hash)
        sources << arg
      else
        sources << arg.to_h
      end
    end
    output_keys = sources.flat_map(&:keys).uniq
    if block_given?
      output_keys.each do |key|
        values = sources.map{|source| source[key]}.compact
        yield(key, *values)
      end
      nil
    else
      result = {}
      output_keys.each do |key|
        values = sources.map{|source| source[key]}.compact
        result[key] = values
      end
      result
    end
  end
end
