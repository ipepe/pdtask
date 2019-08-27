PipelineDeals.configure do |config|
  config.api_key = ENV.fetch('PIPELINE_DEALS_API_KEY') do
    throw 'PIPELINE_DEALS_API_KEY enviroment variable is not set'
  end
end
