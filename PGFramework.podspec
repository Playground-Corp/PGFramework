Pod::Spec.new do |s|
  s.name         = "PGFramework"
  s.version      = "0.1.2"
  s.summary      = "This is Framework of MVC."
  s.description  = <<-DESC
                    - View
		    - Model
                    - Controller
                    - Common
                   DESC

  s.homepage     = "https://github.com/Playground-Corp/PGFramework"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Playground, Inc." => "develop@playground.style" }
  s.social_media_url   = "https://www.facebook.com/PlaygroundCo2019/"
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/Playground-Corp/PGFramework.git", :tag => s.version }
  s.source_files  = "PGFramework/classes/{Controller,Model,Common}/**/*.swift"
  s.resources = "PGFramework/classes/View/**/*.xib" 
  s.requires_arc = true
  s.dependency 'Alamofire'
  s.dependency 'AlamofireImage'
end

