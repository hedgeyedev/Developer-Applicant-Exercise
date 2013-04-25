# -*- coding: utf-8 -*-

require 'spec_helper'
require 'template'

describe Template do
  include Template

  it "should substitute %CODE% with the provided code" do
    expect(template('Code is %CODE%;', '5678901234')).
      to eq('Code is 5678901234;')
  end

  it "should substitute %ALTCODE% with the alternative format for the provided code" do
    expect(template('Alternative Code is %ALTCODE%;', '5678901234')).
      to eq('Alternative Code is 56789-012;')
  end

  it "should handle multiple substitutions" do
    expect(template('Code: %CODE%; AltCode: %ALTCODE% (derived from %CODE%);',
                    '5678901234')).
      to eq('Code: 5678901234; AltCode: 56789-012 (derived from 5678901234);')
  end

end
