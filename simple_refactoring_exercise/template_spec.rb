require './template'
require './spec_helpers' 

describe Template do
  include Template
    
  it "should substitute %CODE% and %ALTCODE% in the template" do
    template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012'
  end
  
  describe_internally Template do
    it "should call convert_to_code(:string) and return the same exact string" do
      convert_to_code("5678901234").should eq "5678901234"
    end
    it "should call convert_to_alt_code(:string) and return :formated_string" do
      convert_to_alt_code('5678901234').should eq "56789-012"
    end
  end
  
  describe "(String.new).replace_hash_patterns" do
    it "should exists and extend String" do
      (String.new).respond_to?('replace_hash_patterns').should == true
    end
    it "should replace all the 'dog' patters with 'cat'" do
      "it's a dog eat dog world".replace_hash_patterns({"dog" => "cat"}).should == "it's a cat eat cat world"
    end
    it "should replace popular lyrics with my own" do
      "Hey I just met you, and this is crazy, but here's my number, so call me maybe".replace_hash_patterns(
      {"you" => "Forrest", "crazy" => "an interview", "number" => "347 272 2943", "maybe" => "with good news"}).should == "Hey I just met Forrest, and this is an interview, but here's my 347 272 2943, so call me with good news"
    end
  end
end
