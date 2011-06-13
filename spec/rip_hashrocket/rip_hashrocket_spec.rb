require 'spec_helper'

describe RipHashrocket do
  describe "#output syntax" do
    it 'should replace \':a => "a"\' syntax' do
      line = '{ :a => "a", :b => "b", :c => "c" }'
      expected = '{ a: "a", b: "b", c: "c" }'

      line.replace_rockets(line).should == expected
    end

    it 'should replace \':a=>"a"\' syntax' do
      line = '{ :a=>"a", :b=>"b", :c=>"c" }'
      expected = '{ a:"a", b:"b", c:"c" }'

      line.replace_rockets(line).should == expected
    end

    it 'should replace \':a    =>    "a"\' syntax, retaining whitespace' do
      line = '{ :a    =>    "a", :b    =>    "b", :c    =>    "c" }'
      expected = '{ a:        "a", b:        "b", c:        "c" }'

      line.replace_rockets(line).should == expected
    end


    it 'should replace  \'=>\' syntax while preserving tabbing/whitespace' do
      lines = [
         ':name         => "Someone"',
         ':address1     => "10 Somewhere Place"',
         ':city         => "ACity"',
         ':state        => "CA"',
         ':country      => "US"',
         ':zip          => "91634"'
      ]
      expected = [
         'name:          "Someone"',
         'address1:      "10 Somewhere Place"',
         'city:          "ACity"',
         'state:         "CA"',
         'country:       "US"',
         'zip:           "91634"'
      ]

      for line, i in lines.each_with_index do
        line.replace_rockets(line).should == expected[i]
      end
    end
  end
end
