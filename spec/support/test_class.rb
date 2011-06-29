class TestClass
  include FormatAlias::Base
  
  attr_accessor :d, :dt
  attr_accessor :poly_id, :poly_type
  attr_accessor :value1, :value2, :value3
  
  date_format_alias(:d, "%Y%m%d")
  date_format_alias(:dt, "%Y%m%d %H:%M")
  
  polymorphic_alias(:poly, :polymorphic => true)
  polymorphic_alias(:values, :attrs => [:value1, :value2, :value3])
end