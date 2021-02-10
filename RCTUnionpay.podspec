
Pod::Spec.new do |s|
    package = JSON.parse(File.read(File.join(__dir__, 'package.json')))
    s.name         = "RCTUnionpay"
    s.version      = package['version']
    s.summary      = package["description"]
    s.homepage     = package['homepage']
    s.license      = "MIT"
    s.author       = { "author" => "cookie" }
    s.platform     = :ios, "8.0"
    s.source       = { :git => "https://github.com/cqcmdwym/react-native-dbb-unionpay", :tag => "master" }
    s.source_files = "ios/RCTUnionpay/**/*.{h,m}"
    s.requires_arc = true
    s.frameworks   = 'CFNetwork','SystemConfiguration'
    s.libraries    = 'z'
    s.vendored_libraries = "ios/RCTUnionpay/paymentcontrol/libs/*.a"
  
    s.dependency "React"
  
  end
  
    