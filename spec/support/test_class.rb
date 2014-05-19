class TestClass
  extend FormatAlias

  attr_accessor :d, :dt, :dy, :dg
  attr_accessor :poly_id, :poly_type
  attr_accessor :value1, :value2, :value3

  date_format_alias(:d, "%Y%m%d")
  date_format_alias(:dt, "%Y%m%d %H:%M")
  date_format_alias(:dy, "%Y", suffix: 'informatted')
  date_format_alias(:dg, "%Y", getter_name: 'a', setter_name: 'b')

  polymorphic_alias(:poly)
#  polymorphic_alias(:values, attrs: [:value1, :value2, :value3])
end