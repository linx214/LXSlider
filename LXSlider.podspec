Pod::Spec.new do |s|  
  s.name             = "LXSlider"
  s.version          = "1.0.5"
  s.summary          = "A customize UISlider."
  s.description      = <<-DESC
                       It is a marquee view used on iOS, which implement by
Objective-C.  
                       DESC
  s.homepage         = "https://github.com/linx214/LXSlider"
  s.license          = 'MIT'
  s.author           = { "linx214" => "linx214@gmail.com" }
  s.source           = { :git => "https://github.com/linx214/LXSlider.git", :tag => s.version }
  s.platform     = :ios, '8.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'LXSlider/LXSlider.{h,m}'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  s.dependency 'Masonry'

end