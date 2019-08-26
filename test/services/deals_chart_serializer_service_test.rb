# frozen_string_literal: true

require 'test_helper'
class DealsChartSerializerServiceTest < ActiveSupport::TestCase
  test 'returns mocked output' do
    service = DealsChartSerializerService.new
    data_hash = service.output

    assert_equal Hash, data_hash.class
    assert_not_empty data_hash[:chart_labels]
    assert_not_empty data_hash[:chart_data]

    # at least two deals in one deal_stage
    assert(service.send(:deals_grouped_by_stage).any? { |_, grouped_deals| grouped_deals.size > 1 })
  end

  test 'returns sorted labels' do
    service = DealsChartSerializerService.new
    deals = service.send(:deals)
    sorted_deal_stages = service.send(:sorted_deal_stages)

    deal_stage_percents = deals.map(&:deal_stage).map(&:percent)

    assert_not_equal deal_stage_percents, deal_stage_percents.sort

    assert_equal deal_stage_percents.sort.uniq, sorted_deal_stages.map(&:percent)
  end

  test 'returns deals data sorted according to deal stages' do
    service = DealsChartSerializerService.new
    data_hash = service.output

    deals = service.send(:deals)

    service.send(:sorted_deal_stages).each.with_index do |deal_stage, index|
      sum = deals.select { |deal| deal.deal_stage.id == deal_stage.id }.sum(&:value_in_cents).to_f / 100.0
      assert_equal sum, data_hash[:chart_data][index]
    end

    service.send(:deals_grouped_by_stage).select { |_, grouped_deals| grouped_deals.size > 1 }.first
  end
end
