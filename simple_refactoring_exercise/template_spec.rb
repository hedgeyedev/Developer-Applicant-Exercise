require 'rspec'
require 'pry'
require_relative 'template'

RSpec.describe Template do
  include Template
  binding.pry

  it "should substitute %CODE% and %ALTCODE% in the template" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', '5678901234')).to eq 'Code is 5678901234; alt code is 56789-012'
  end

end
