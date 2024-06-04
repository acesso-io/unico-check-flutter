#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint unico_check.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'unico_check'
  s.version          = '2.1.3'
  s.summary          = 'Esta biblioteca visa implementar a tecnologia Unico.'
  s.description      = <<-DESC
Esta biblioteca visa implementar a tecnologia Unico.
                       DESC
  s.homepage         = 'https://developers.unico.io/docs/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'unico id tech' => 'suporte.unicocheck@unico.io' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency  'unicocheck-ios', '2.14.1'
  s.static_framework = false
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.4'
end
