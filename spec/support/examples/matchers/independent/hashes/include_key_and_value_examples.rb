shared_examples "an IncludeKeyAndValueMatcher" do
  context 'when evaluating a matched hash (target key and target value are present)' do
    context 'when positiviely evaluating' do
      it 'succeeds (in matching just the key)' do
        expect(matched_hash).to include_key(key)
      end
      it 'succeeds (in matching both the key and the value)' do
        expect(matched_hash).to include_key(key).with_value(value)
      end
    end
    
    context 'when negatively evaluating' do
      it 'fails (in matching just the key)' do
        expect {
          expect(matched_hash).to_not include_key(key)
        }.to fail_with_message(neg_key_only_msg)
      end
      it 'fails (in matching both the key and the value)' do
        expect {
          expect(matched_hash).to_not include_key(key).with_value(value)
        }.to fail_with_message(neg_key_with_value_msg)
      end
    end
  end
  
  context 'when evaluating a partially mismatched hash (only target key is present)' do
    context 'when positiviely evaluating' do
      it 'succeeds (in matching just the key)' do
        expect(partially_mismatched_hash).to include_key(key)
      end
      it 'fails (in matching both the key and the value)' do
        expect {
          expect(partially_mismatched_hash).to include_key(key).with_value(value)
        }.to fail_with_message(key_with_value_msg)
      end
    end
    
    context 'when negatively evaluating' do
      it 'fails (in matching just the key)' do
        expect {
          expect(partially_mismatched_hash).to_not include_key(key)
        }.to fail_with_message(neg_key_only_msg)
      end
      it 'succeeds (in matching both the key and the value)' do
        expect(partially_mismatched_hash).to_not include_key(key).with_value(value)
      end
    end
  end
  
  context 'when evaluating a totally mismatched hash (neither target key nor target value are present)' do
    context 'when positiviely evaluating' do
      it 'fails (in matching just the key)' do
        expect {
          expect(totally_mismatched_hash).to include_key(key)
        }.to fail_with_message(key_only_msg)
      end
      it 'fails (in matching both the key and the value)' do
        expect {
          expect(totally_mismatched_hash).to include_key(key).with_value(value)
        }.to fail_with_message(key_with_value_msg)
      end
    end
    
    context 'when negatively evaluating' do
      it 'succeeds (in matching just the key)' do
        expect(totally_mismatched_hash).to_not include_key(key)
      end
      it 'succeeds (in matching both the key and the value)' do
        expect(totally_mismatched_hash).to_not include_key(key).with_value(value)
      end
    end
  end
end