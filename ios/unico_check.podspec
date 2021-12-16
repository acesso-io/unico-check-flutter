#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint unico_check.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'unico_check'
  s.version          = '2.0.1'
  s.summary          = 'Esta biblioteca visa implementar a tecnologia Unico.'
  s.description      = <<-DESC
Esta biblioteca visa implementar a tecnologia Unico.
                       DESC
  s.homepage         = 'https://www3.acesso.io/sdkbio'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'unico id tech' => 'suporte.unicocheck@unico.io' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency  'unicocheck-ios', '~> 1.0.2'
  s.static_framework = false
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
