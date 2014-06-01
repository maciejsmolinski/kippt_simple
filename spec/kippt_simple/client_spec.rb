# -*- encoding : utf-8 -*-
require "spec_helper"

RSpec.describe KipptSimple::Client do

  it "should be initialized with username and token" do
    expect(described_class.new({username: 'test', token: 'test'})).to be_instance_of(described_class)
  end

  it "should throw an error if username or token is empty or no options are provided" do
    expect { described_class.new({username: '', token: ''}) }.to raise_error(ArgumentError)
    expect { described_class.new({username: '', token: ''}) }.not_to be_instance_of(described_class)

    expect { described_class.new({username: ''}) }.to raise_error(ArgumentError)
    expect { described_class.new({username: ''}) }.not_to be_instance_of(described_class)

    expect { described_class.new({username: 'test'}) }.to raise_error(ArgumentError)
    expect { described_class.new({username: 'test'}) }.not_to be_instance_of(described_class)

    expect { described_class.new({token: ''}) }.to raise_error(ArgumentError)
    expect { described_class.new({token: ''})    }.not_to be_instance_of(described_class)

    expect { described_class.new({token: 'test'})    }.to raise_error(ArgumentError)
    expect { described_class.new({token: 'test'})    }.not_to be_instance_of(described_class)

    expect { described_class.new }.to raise_error(ArgumentError)
    expect { described_class.new }.not_to be_instance_of(described_class)
  end

  it "should forward #get method call to connection instance" do
    client     = described_class.new({username: 'test', token: 'test'})

    # Fake connection
    connection = double("connection")
    client.instance_variable_set :@connection, connection

    # Set expectation
    expect(connection).to receive(:get) { 'lists' }

    # Trigger #get method on client (should forward to connection)
    client.get 'lists'
  end

end