# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/android'
require './lib/yesyoucam'

begin
  require 'bundler'
  require 'motion/project/template/gem/gem_tasks'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'yesyoucam'
  app.target_api_version = "16"

  app.archs = ["x86"] unless ARGV.include?("device") || ARGV.include?("release")
  app.package = "com.gantlaborde.yesyoucam"
  app.theme = "@android:style/Theme.Holo.Light"
  app.icon = 'ic_launcher'

  app.application_class = "BluePotionApplication"
  app.main_activity = "PMHomeActivity"
  app.sub_activities += %w(PMSingleFragmentActivity PMNavigationActivity)
end
