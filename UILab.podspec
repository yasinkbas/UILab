Pod::Spec.new do |s|
  s.name             = 'UILab'
  s.version          = '0.1.0'
  s.summary          = 'Makes easier programmatically UI management.'
  s.homepage         = 'https://github.com/yasinkbas/UILab'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yasinkbas' => 'yasin.kbas12@gmail.com' }
  s.source           = { :git => 'https://github.com/yasinkbas/UILab.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  s.ios.deployment_target = '8.0'
  s.source_files = 'UILab/Classes/**/*'
end
