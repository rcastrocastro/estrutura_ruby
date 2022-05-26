Before do
  @service = ->(klass) { klass.new }
end

After do |scenario|
  exception_message(scenario)
end

def exception_message(scenario)
  scene = scenario.failed?
  return unless scene == true

  p "\n--------------------------------------------------------------------------------------------"
  p 'Reason:'
  p "\n - Request  body: #{@payload.to_json}"
  p "\n - Response code: #{@response.response.code}"
  p "\n - Response body: #{@response.parsed_response.to_json}"
  p "\n🐞🐞🐞🐞🐞🐞🐞 #{scenario.exception.message}"
  p "--------------------------------------------------------------------------------------------\n"
end

AfterConfiguration do |config|
  config.on_event(:test_case_finished) do |event|
    p "\n--------------------------------------------------------------------------------------------------"
    p 'Results:'
    p " - Scenario......: #{event.test_case.name}"
    p " - The results is: [ #{event.result.passed? ? '✅ ]' : '❌ ]'}"
    p "--------------------------------------------------------------------------------------------------\n"
  end
end

at_exit do
  @infos = {
    'Data do Teste' => Time.now.strftime('%d/%B/%Y'),
    'Hora do Teste' => Time.now.strftime('%HH%MM%SS')
  }

  ReportBuilder.configure do |config|
    config.input_path = 'report/report.json'
    config.report_path = 'report/report'
    config.report_types = [:html]
    config.include_images = true
    config.report_title = '[DOJO] - Automação DB'
    config.additional_info = @infos
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end
