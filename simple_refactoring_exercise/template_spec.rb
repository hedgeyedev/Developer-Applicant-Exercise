require_relative "template"

describe Template do
  include Template

  #functional test
  it "should substitute %CODE% and %ALTCODE% in the template" do
    template("Code is %CODE%; alt code is %ALTCODE%", "5678901234").should == "Code is 5678901234; alt code is 56789-012"
  end
  
  #functional test (no replacements
  it "should substitute nothing in the template" do
    template("Code is nothing; alt code is nothing", "5678901234").should == "Code is nothing; alt code is nothing"
  end
  
  #req_id wrong datatype test
  it "should raise an error" do
    expect { template("Code is %CODE%; alt code is %ALTCODE%", 5678901234) }.to raise_error(ArgumentError)
  end
  
  #req_id wrong length test
  it "should raise an error" do
    expect { template("Code is %CODE%; alt code is %ALTCODE%", "5678") }.to raise_error(ArgumentError)
  end
  
  #req_id nil test
  it "should raise an error" do
    expect { template("Code is %CODE%; alt code is %ALTCODE%", nil) }.to raise_error(ArgumentError)
  end
  
  #template wrong datatype test
  it "should raise an error" do
    expect { template(32, "5678901234") }.to raise_error(ArgumentError)
  end
  
  #template nil test
  it "should raise an error" do
    expect { template(nil, "5678901234") }.to raise_error(ArgumentError)
  end
  
end
