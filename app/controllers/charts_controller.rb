class ChartsController < ApplicationController
  def deal_values_by_stage
    @deals_chart_data = DealsChartSerializerService.new.output
  end
end
