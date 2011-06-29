require 'spec_helper'

describe "FormatAlias spec" do
  before(:each) do
    @t = TestClass.new
  end

  context "date/time conversions" do
    it "should correctly convert dates" do
      d = DateTime.new(2009, 1, 1)
      @t.d = d
      @t.d_formatted.should eq("20090101")
    
      @t.d_formatted = nil
      @t.d.should be_nil
    
      @t.d_formatted = "20090202"
      @t.d.should_not be_nil
      @t.d.year.should eq(2009)
      @t.d.month.should eq(2)
      @t.d.day.should eq(2)
    end
  
    it "should correctly convert dates with time zones" do
      d = DateTime.new(2009, 1, 1, 12, 0)
      @t.dt = d
      @t.dt_formatted.should eq("20090101 12:00")

      Time.use_zone 'Moscow' do
        d = DateTime.new(2009, 1, 1, 12, 0)
        @t.dt = d
        @t.dt_formatted.should eq("20090101 12:00")
      end
    end
  end
  
  context "polymorphic conversions" do
    it "should correctly convert polymorphic" do
      @t.poly_type_id = "Page:3"
      @t.poly_type.should == 'Page'
      @t.poly_id.should == '3'
      
      @t.poly_type_id = "Banner:4"
      @t.poly_type_id.should == "Banner:4"
      
      @t.poly_type_id = nil
      @t.poly_type_id.should == nil

      @t.poly_type = nil
      @t.poly_id = 5
      @t.poly_type_id.should == "5"
    end
  end
end