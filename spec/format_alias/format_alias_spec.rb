require 'spec_helper'

describe "FormatAlias spec" do
  before(:each) do
    @t = TestClass.new
  end

  context "date/time conversions" do
    it "correctly converts dates" do
      d = DateTime.new(2009, 1, 1)
      @t.d = d
      expect(@t.d_formatted).to eq("20090101")

      @t.d_formatted = nil
      expect(@t.d).to be_nil

      @t.d_formatted = "20090202"
      @t.d.should_not be_nil
      expect(@t.d.year).to eq(2009)
      expect(@t.d.month).to eq(2)
      expect(@t.d.day).to eq(2)
    end

    it "correctly converts dates with time zones" do
      d = DateTime.new(2009, 1, 1, 12, 0)
      @t.dt = d
      @t.dt_formatted.should eq("20090101 12:00")
    end

    it "works with suffix option" do
      @t.dy_informatted = "20090202"
      expect(@t.dy_informatted).to eq("2009")
    end

    it "works with getter/setter names option" do
      @t.b = "20090202"
      expect(@t.a).to eq("2009")
    end
  end

  context "polymorphic conversions" do
    it "should correctly convert polymorphic" do
      @t.poly_formatted = "Page:3"
      expect(@t.poly_type).to eq('Page')
      expect(@t.poly_id).to eq('3')

      @t.poly_formatted = "Banner:4"
      expect(@t.poly_formatted).to eq("Banner:4")

      @t.poly_formatted = nil
      expect(@t.poly_formatted).to eq(nil)

      @t.poly_type = nil
      @t.poly_id = 5
      expect(@t.poly_formatted).to eq("5")
    end
  end
end