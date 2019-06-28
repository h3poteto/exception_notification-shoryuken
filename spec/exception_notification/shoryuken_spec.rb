require 'spec_helper'

describe ExceptionNotification::Shoryuken do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe 'server middleware' do
    before { Shoryuken&.server_middleware&.add described_class::ExceptionNotificationMiddleware }

    after do
      Shoryuken&.server_middleware&.entries&.delete_if do |entry|
        entry.klass == described_class::ExceptionNotificationMiddleware
      end
    end

    it 'add notification' do
      expect(Shoryuken&.server_middleware&.entries&.map(&:klass)).to include(described_class::ExceptionNotificationMiddleware)
    end
  end
end
