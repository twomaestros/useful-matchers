require 'spec_helper'

describe UsefulMatchers::Matchers::Independent::Hashes::IncludeKeyAndValueMatcher do
  let(:matched_hash)              { { key => value } }
  let(:partially_mismatched_hash) { { key => 'Adams' } }
  let(:totally_mismatched_hash)           { { john: 'Adams' } }
  
  context 'when the target key and value are typical' do
    let(:key)                    { :george }
    let(:value)                  { 'Washington' }
    let(:key_only_msg)           { "expected that the hash contains :george as a key" }
    let(:key_with_value_msg)     { "expected that the value for key :george in the hash is Washington" }
    let(:neg_key_only_msg)       { "expected that the hash doesn't contain :george as a key" }
    let(:neg_key_with_value_msg) { "expected that the value for key :george in the hash isn't Washington" }
    it_behaves_like 'an IncludeKeyAndValueMatcher'
  end
  
  context 'when the target key and value are nils' do
    let(:key)                    { nil }
    let(:value)                  { nil }
    let(:key_only_msg)           { "expected that the hash contains nil as a key" }
    let(:key_with_value_msg)     { "expected that the value for key nil in the hash is nil" }
    let(:neg_key_only_msg)       { "expected that the hash doesn't contain nil as a key" }
    let(:neg_key_with_value_msg) { "expected that the value for key nil in the hash isn't nil" }
    it_behaves_like 'an IncludeKeyAndValueMatcher'
  end
  
  context 'when the target key and value are empty strings' do
    let(:key)                    { '' }
    let(:value)                  { '' }
    let(:key_only_msg)           { "expected that the hash contains empty string as a key" }
    let(:key_with_value_msg)     { "expected that the value for key empty string in the hash is empty string" }
    let(:neg_key_only_msg)       { "expected that the hash doesn't contain empty string as a key" }
    let(:neg_key_with_value_msg) { "expected that the value for key empty string in the hash isn't empty string" }
    it_behaves_like 'an IncludeKeyAndValueMatcher'
  end
end