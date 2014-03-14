Pod::Spec.new do |s|
  s.name         = "EXKit"
  s.version      = "0.0.7"
  s.summary      = "EXKit"
  s.license      = 'MIT'
  s.homepage     = "https://github.com/kaneshin/EXKit"
  s.author       = { "Shintaro Kaneko" => "kaneshin0120@gmail.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/kaneshin/EXKit.git", :tag => "0.0.7" }
  s.source_files = 'EXKit/**/*'
  s.frameworks = 'CoreData', 'UIKit', 'SystemConfiguration'
  s.requires_arc = true
end
