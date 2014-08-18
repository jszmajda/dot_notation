require "dot_notation/version"

module DotNotation
  # Your code goes here...
  def self.included(base)
    raise "Unsupported Class" unless base.respond_to?('[]')
  end

  def dot(path)
    return nil if self.nil? # optimization for NilClass

    data = self
    path.split(/\./).each do |selector|

      selector = selector.to_i if selector =~ /^\d+$/

      if value = access(data, selector)
        data = value
      else
        return nil
      end
    end

    if @dot_options && @dot_options[:autodot]
      extend_result!(data)
      data.each{|e| extend_result!(e) } if data.kind_of? Array
    end

    data
  end

  def dot_options(options)
    @dot_options = (@dot_options || {}).merge(options)
  end

  private

  def extend_result!(result)
    begin
      result.extend(DotNotation)
      result.dot_options(@dot_options)
    rescue TypeError
      # ignore, we get this when trying to extend an int or something
    end
  end

  def access(data, selector)
    if defined?(ActiveRecord::Base) && data.kind_of?(ActiveRecord::Base)
      access_active_record(data, selector)
    else
      access_generic(data, selector)
    end
  end

  def access_active_record(data, selector)
    selsym = selector.respond_to?(:to_sym) ? selector.to_sym : nil
    if selsym && data.respond_to?(selsym)
      data.send(selsym)
    else
      access_generic(data, selector)
    end
  end

  def access_generic(data, selector)
    if data[selector]
      data[selector]
    else
      selsym = selector.respond_to?(:to_sym) ? selector.to_sym : nil
      if selsym && data[selsym]
        data[selsym]
      else
        nil
      end
    end
  end
end
