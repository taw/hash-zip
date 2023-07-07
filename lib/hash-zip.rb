# Enumerable#zip is nonsense when applied to Hashes
class Hash
  def zip(*args, ignore_nils: false)
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
        values = sources.map{|source| source[key]}
        if ignore_nils
          values = values.compact
        end
        yield(key, *values)
      end
      nil
    else
      result = {}
      output_keys.each do |key|
        values = sources.map{|source| source[key]}
        if ignore_nils
          values = values.compact
        end
        result[key] = values
      end
      result
    end
  end
end
