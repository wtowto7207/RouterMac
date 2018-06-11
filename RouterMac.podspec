
Pod::Spec.new do |s|

  s.name         = "RouterMac"
  s.version      = "0.0.4"
  s.summary      = "A short description of RouterMac."
  s.homepage     = "https://github.com/wtowto7207"
  s.license      = "MIT"
  s.author       = { "wtowto7207" => "wtowto7207@163.com" }
  s.platform = :ios
  s.ios.deployment_target = "8.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/wtowto7207/RouterMac.git", :tag => "#{s.version}" }
  s.resource = 'Source/**/*.xib'
  s.source_files  = "Source/*.{h,m,mm}"

end
