# frozen_string_literal: true

require 'test_helper'
class ChartsControllerTest < ActionDispatch::IntegrationTest
  test 'assert_react_component' do
    get '/'
    assert_equal 200, response.status

    # assert rendered react component and check the props
    assert_react_component 'DealValuesByStageChart' do |props|
      assert_not_empty props[:chart_labels]
      assert_not_empty props[:chart_data]
    end
  end
end
