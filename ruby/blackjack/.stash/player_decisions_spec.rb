# frozen_string_literal: true

# require_relative '../../../lib/blackjack/player_decisions'
#
# module Blackjack
#   RSpec.describe PlayerDecisions do
#     subject { Object.new.tap { |fake| fake.extend(PlayerDecisions) } }
#
#     describe '#hit' do
#       context 'when mixin not implemented' do
#         it 'raises not implemented error' do
#           expect { subject.hit! }.to raise_error(NotImplementedError)
#         end
#       end
#     end
#
#     describe '#stand!' do
#       subject { Object.new.tap { |fake| fake.extend(PlayerDecisions) } }
#
#       describe 'aliases' do
#         it { expect(subject.method(:stand!)).to eq(subject.method(:stick!)) }
#         it { expect(subject.method(:stand!)).to eq(subject.method(:stand_pat!)) }
#         it { expect(subject.method(:stand!)).to eq(subject.method(:stay!)) }
#       end
#
#       context 'when mixin not implemented' do
#         it 'raises not implemented error' do
#           expect { subject.stand! }.to raise_error(NotImplementedError)
#         end
#       end
#     end
#   end
# end
