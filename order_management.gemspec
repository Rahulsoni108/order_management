require_relative "lib/order_management/version"

Gem::Specification.new do |spec|
  spec.name        = "order_management"
  spec.version     = OrderManagement::VERSION
  spec.authors     = [ "rahul" ]
  # spec.email       = [ "" ]
  spec.homepage    = "https://github.com/Rahulsoni108/order_management"
  spec.summary     = "Summary of OrderManagement."
  spec.description = "Description of OrderManagement."
  # spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Rahulsoni108/order_management"
  spec.metadata["changelog_uri"] = "https://github.com/Rahulsoni108/order_management"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.2"
  spec.add_dependency 'fast_jsonapi'
end
