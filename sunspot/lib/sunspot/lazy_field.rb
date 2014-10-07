module Sunspot
  class LazyField
    attr_accessor :name
    attr_accessor :type_str
    attr_accessor :opts

    def initialize name, type, opts = {}
      self.name = name.to_sym
      self.type_str = type.to_sym
      self.opts = opts
    end

    def type
      case self.type_str
        when :integer
          Type::IntegerType.instance
        when :date
          Type::DateType.instance
        when :time
          Type::TimeType.instance
        when :boolean
          Type::BooleanType.instance
        when :text
          Type::TextType.instance
        when :long
          Type::LongType.instance
        when :float
          Type::FloatType.instance
        when :double
          Type::DoubleType.instance
        else
          Type::StringType.instance
      end
    end
  end
end