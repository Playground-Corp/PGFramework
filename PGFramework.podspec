Pod::Spec.new do |s|
  s.name         = "PGFramework"
  s.version      = "0.1.6"
  s.summary      = "This OSS is develop tool for Playground, Inc."
  s.description  = <<-DESC
                    - Create view and controller
		    - Connection functions
                    - Common functions
                   DESC
  s.swift_version = '4.0'
  s.homepage     = "https://github.com/Playground-Corp/PGFramework"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Playground, Inc." => "develop@playground.style" }
  s.social_media_url   = "https://www.facebook.com/PlaygroundCo2019/"
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/Playground-Corp/PGFramework.git", :tag => s.version }
  s.source_files  = "PGFramework/classes/{Controller,Model,Common}/**/*.swift"
  s.resources = "PGFramework/classes/View/**/*.xib" 
  s.requires_arc = true
  s.script_phase = { :name => 'Hello World', :script => 'echo "Hello World"' }
  s.dependency 'Alamofire'
  s.dependency 'AlamofireImage'
end

