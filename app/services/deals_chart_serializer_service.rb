class DealsChartSerializerService
  def output
    {
      chart_labels: labels,
      chart_data: data
    }
  end

  private

  def labels
    sorted_deal_stages.map do |deal_stage|
      "#{deal_stage.name} (#{deal_stage.percent}%)"
    end
  end

  def data
    sorted_deal_stages.map do |deal_stage|
      deals_in_stage = deals_grouped_by_stage[deal_stage.id]
      # TODO: what if there are different currency deals?
      deals_in_stage.sum(&:value_in_cents).to_f / 100.0
    end
  end

  def deals_grouped_by_stage
    deals.group_by { |deal| deal.deal_stage.id }
  end

  def sorted_deal_stages
    deals.map(&:deal_stage).uniq.sort_by(&:percent)
  end

  def deals
    @deals ||= (PipelineDeals::Deal.find(:all) || [])
  end
end
