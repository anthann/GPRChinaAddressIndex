#
# Be sure to run `pod lib lint GPRChinaAddressIndex.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GPRChinaAddressIndex"
  s.version          = "0.1.0"
  s.summary          = "A index of China's top three levels of address"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A index of China's top three levels of address: province, city, town.
The example of this lib is a address picker, to indicate how it works.
                       DESC

  s.homepage         = "https://github.com/anthann/GPRChinaAddressIndex"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "anthann" => "72115165g@gmail.com" }
  s.source           = { :git => "https://github.com/anthann/GPRChinaAddressIndex.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GPRChinaAddressIndex/Classes/*'
  
  s.resource_bundles = {
    'GPRChinaAddressIndex' => ['GPRChinaAddressIndex/Assets/*.db']
  }

  # s.public_header_files = 'Pod/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'FMDB', '2.6.2'
end
