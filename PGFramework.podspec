Pod::Spec.new do |s|
  s.name         = "PGFramework"
  s.version      = "0.2.1"
  s.summary      = "This is the develop fast tool for Playground, Inc."
  s.description  = <<-DESC
                    - Create view and controller
                    - Common functions
                   DESC
  s.swift_version = '4.0'
  s.homepage     = "https://github.com/Playground-Corp/PGFramework"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Playground, Inc." => "develop@playground.style" }
  s.social_media_url   = "https://www.facebook.com/PlaygroundCo2019/"
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/Playground-Corp/PGFramework.git", :tag => s.version }
  s.source_files  = "PGFramework/classes/{Base,Common}/**/*.swift"
  s.requires_arc = true
end

