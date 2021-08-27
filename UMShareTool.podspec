#
# Be sure to run `pod lib lint UMShareTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UMShareTool'
  s.version          = '1.0.0'
  s.summary          = 'A short description of UMShareTool.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/DoMyself/UMShareTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = {  '2434783536@qq.com' }
  s.source           = { :git => 'https://github.com/DoMyself/UMShareTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.static_framework = true

  s.source_files = 'UMShareTool/Classes/**/*'
  
  # s.resource_bundles = {
  #   'UMShareTool' => ['UMShareTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'UMCommon', '~>7.3.3'
  s.dependency 'UMDevice', '~>2.0.3'
  s.dependency 'UMShare/Social/WeChat'
  s.dependency 'UMShare/UI'
  s.dependency 'UMShare/Social/WeChat'
  s.dependency 'UMShare/Social/QQ'
  s.dependency 'UMShare/Social/Sina'
end
