#
# Be sure to run `pod lib lint CDMRDLNATool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CDMRDLNATool'
  s.version          = '0.1.0'
  s.summary          = '投屏工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
投屏工具, 基于MRDLNA第三方的封装, 方便使用
                       DESC

  s.homepage         = 'https://github.com/HavenWWH'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = 'MIT'
  s.author           = { '513433750@qq.com' => '513433750@qq.com' }
  s.source           = { :git => 'https://github.com/HavenWWH/CDMRDLNATool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CDMRDLNATool/*.{h,m}'
  
  # s.resource_bundles = {
  #   'CDMRDLNATool' => ['CDMRDLNATool/*.{h,m}']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'MRDLNA', '~> 0.1.1'
  s.dependency 'CocoaAsyncSocket'
  s.xcconfig = {'ENABLE_BITCODE' => 'NO',
      'HEADER_SEARCH_PATHS' => '${SDKROOT}/usr/include/libxml2',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
end
