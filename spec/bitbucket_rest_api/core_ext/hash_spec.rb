# encoding: utf-8

require 'spec_helper'

describe Hash do

  before do
    BitBucket.new
    @hash = { :a => 1, :b => 2, :c => 'e'}
    @serialized = "a=1&b=2&c=e"
    @nested_hash = { 'a' => { 'b' => {'c' => 1 } } }
    @symbols = { :a => { :b => { :c => 1 } } }
  end

  context '#except!' do
    # TODO fix this test after fixing except!
    xit 'should respond to except!' do
      @nested_hash.should respond_to :except!
      copy = @nested_hash.dup
      copy.except!('b', 'a')
      copy.should be_empty
    end
  end

  context '#except' do
    it 'should respond to except' do
      expect(@nested_hash).to respond_to :except
    end

    # TODO fix this test after fixing except!
    xit 'should remove key from the hash' do
      @nested_hash.except('a').should be_empty
    end
  end

  context '#symbolize_keys' do
    it 'should respond to symbolize_keys' do
      expect(@nested_hash).to respond_to :symbolize_keys
    end
  end

  context '#symbolize_keys!' do
    it 'should respond to symbolize_keys!' do
      expect(@nested_hash).to respond_to :symbolize_keys!
    end

    it 'should convert nested keys to symbols' do
      expect(@nested_hash.symbolize_keys!).to eq @symbols
    end
  end

  context '#serialize' do
    it 'should respond to serialize' do
      expect(@nested_hash).to respond_to :serialize
    end

    it 'should serialize hash' do
      expect(@hash.serialize).to eq @serialized
    end
  end

  context '#deep_key?' do
    it 'should find key inside nested hash' do
      expect(@nested_hash.has_deep_key?('c')).to be_truthy
    end
  end
end # Hash
