# frozen_string_literal: true

RSpec.describe 'Smoke test' do
  specify do
    stub_const('MyLittleOperation', Class.new(SmartCore::Operation) do
      param :name, :string
      option :meta, :hash
    end)

    MyLittleOperation.call('test', meta: {})
  end
end
