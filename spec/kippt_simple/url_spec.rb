# -*- encoding : utf-8 -*-
require "spec_helper"

RSpec.describe KipptSimple::URL do

  it "should be initialized with URI (string)" do
    expect(described_class.new('lists')).to be_instance_of(described_class)
    expect(described_class.new('/api/lists')).to be_instance_of(described_class)
  end

  it "should throw an error if no argument is passed or argument is empty" do
    expect { described_class.new nil}.to raise_error(ArgumentError)
    expect { described_class.new nil}.not_to be_instance_of(described_class)
    expect { described_class.new ''}.to raise_error(ArgumentError)
    expect { described_class.new ''}.not_to be_instance_of(described_class)
    expect { described_class.new }.to raise_error(ArgumentError)
    expect { described_class.new }.not_to be_instance_of(described_class)
  end

  it "#self.base should return base kippt url" do
    expect(described_class::base).to eq('https://kippt.com')
  end

  it "#normalize_uri should return correct API uri" do
    expect(described_class.new('lists').normalize_uri).to eq('/api/lists')
    expect(described_class.new('/api/lists').normalize_uri).to eq('/api/lists')
    expect(described_class.new('lists?test').normalize_uri).to eq('/api/lists?test')
    expect(described_class.new('/api/lists?test').normalize_uri).to eq('/api/lists?test')
  end

  it "#full_url should return correct API url" do
    expect(described_class.new('lists').full_url).to eq('https://kippt.com/api/lists')
    expect(described_class.new('lists?test').full_url).to eq('https://kippt.com/api/lists?test')
    expect(described_class.new('/api/lists').full_url).to eq('https://kippt.com/api/lists')
    expect(described_class.new('/api/lists?test').full_url).to eq('https://kippt.com/api/lists?test')
  end

  it "#resource_type should return capitalized name of resource" do
    expect(described_class.new('lists').resource_type).to eq('Lists')
    expect(described_class.new('lists?test').resource_type).to eq('Lists')
    expect(described_class.new('/api/lists').resource_type).to eq('Lists')
    expect(described_class.new('/api/lists?test').resource_type).to eq('Lists')
    expect(described_class.new('test').resource_type).to eq('Test')
    expect(described_class.new('test?test').resource_type).to eq('Test')
    expect(described_class.new('/api/test').resource_type).to eq('Test')
    expect(described_class.new('/api/test?test').resource_type).to eq('Test')

  end

end