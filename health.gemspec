Gem::Specification.new do |s|
  s.name        = 'health'
  s.version     = '1.0.0'
  s.date        = '2017-06-22'
  s.summary     = "Health checking"
  s.description = "Does rpc health checking"
  s.authors     = ["Andela"]
  s.email       = 'devops@andela.com'
  s.files       = ["lib/health.rb", "lib/health_services_pb.rb", "lib/health_pb.rb"]
  s.homepage    =
    'https://github.com/andela/micro-ruby-health-check'
  s.add_runtime_dependency 'grpc'
end