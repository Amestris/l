# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "l"
  s.version = "0.3.26"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bartek Bulat", "Krzystof Kosman"]
  s.date = "2013-07-03"
  s.description = "Bunch of generators for lazy programmers"
  s.email = "admin@1000i.pl"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "Rakefile",
    "app/controllers/l/admins_controller.rb",
    "app/controllers/l/facebook_controller.rb",
    "app/controllers/l/galleries_controller.rb",
    "app/controllers/l/gallery_photos_controller.rb",
    "app/controllers/l/mobile_controller.rb",
    "app/controllers/l/news_controller.rb",
    "app/controllers/l/newsletter_mails_controller.rb",
    "app/controllers/l/pages_controller.rb",
    "app/controllers/l/users_controller.rb",
    "app/helpers/l/filter_helper.rb",
    "app/helpers/l/form_helper.rb",
    "app/helpers/l/lazy_helper.rb",
    "app/helpers/l/lightbox_helper.rb",
    "app/models/l/gallery.rb",
    "app/models/l/gallery_photo.rb",
    "app/models/l/news.rb",
    "app/models/l/newsletter_mail.rb",
    "app/models/l/page.rb",
    "app/views/l/admins/_form.html.erb",
    "app/views/l/admins/_submenu.erb",
    "app/views/l/admins/_tooltip.html.erb",
    "app/views/l/admins/partials/_content.erb",
    "app/views/l/admins/partials/_footer.erb",
    "app/views/l/admins/partials/_header.erb",
    "app/views/l/admins/show.erb",
    "app/views/l/galleries/_edit_form.erb",
    "app/views/l/galleries/_form.html.erb",
    "app/views/l/galleries/_gallery_item.html.erb",
    "app/views/l/galleries/_submenu.erb",
    "app/views/l/galleries/_tooltip.html.erb",
    "app/views/l/galleries/edit.html.erb",
    "app/views/l/galleries/index.html.erb",
    "app/views/l/galleries/list.html.erb",
    "app/views/l/galleries/new.html.erb",
    "app/views/l/galleries/show.html.erb",
    "app/views/l/gallery_photos/_show_photos.erb",
    "app/views/l/gallery_photos/create.js.erb",
    "app/views/l/gallery_photos/create.rjs",
    "app/views/l/gallery_photos/destroy.js.erb",
    "app/views/l/gallery_photos/destroy.rjs",
    "app/views/l/layouts/admin.html.erb",
    "app/views/l/layouts/admin_login.html.erb",
    "app/views/l/layouts/facebook.html.erb",
    "app/views/l/layouts/mobile.html.erb",
    "app/views/l/layouts/standard.html.erb",
    "app/views/l/layouts/subpage.html.erb",
    "app/views/l/mobile/error401.html.erb",
    "app/views/l/mobile/error404.html.erb",
    "app/views/l/mobile/index.html.erb",
    "app/views/l/news/_edit_form.erb",
    "app/views/l/news/_form.html.erb",
    "app/views/l/news/_submenu.erb",
    "app/views/l/news/_tooltip.html.erb",
    "app/views/l/news/destroy.js.erb",
    "app/views/l/news/edit.html.erb",
    "app/views/l/news/index.html.erb",
    "app/views/l/news/list.html.erb",
    "app/views/l/news/new.html.erb",
    "app/views/l/news/show.html.erb",
    "app/views/l/newsletter_mails/_form.html.erb",
    "app/views/l/newsletter_mails/_submenu.erb",
    "app/views/l/newsletter_mails/_tooltip.html.erb",
    "app/views/l/newsletter_mails/create.js.erb",
    "app/views/l/newsletter_mails/create_error.js.erb",
    "app/views/l/newsletter_mails/index.html.erb",
    "app/views/l/newsletter_mails/send_mail_edit.html.erb",
    "app/views/l/pages/_edit_form.erb",
    "app/views/l/pages/_form.html.erb",
    "app/views/l/pages/_page_item.html.erb",
    "app/views/l/pages/_submenu.erb",
    "app/views/l/pages/_tooltip.html.erb",
    "app/views/l/pages/edit.html.erb",
    "app/views/l/pages/hidden.rjs",
    "app/views/l/pages/index.html.erb",
    "app/views/l/pages/new.html.erb",
    "app/views/l/pages/show.html.erb",
    "app/views/l/partials/_analytics.html.erb",
    "app/views/l/partials/_breadcrumbs.erb",
    "app/views/l/partials/_content.erb",
    "app/views/l/partials/_content_main.erb",
    "app/views/l/partials/_errors.html.erb",
    "app/views/l/partials/_footer.erb",
    "app/views/l/partials/_head.erb",
    "app/views/l/partials/_header.erb",
    "app/views/l/partials/_info_box.erb",
    "app/views/l/partials/_newsletter_box.erb",
    "app/views/l/partials/_search.erb",
    "app/views/l/partials/_social.erb",
    "app/views/l/partials/_switcher.erb",
    "app/views/l/partials/facebook/_content.html.erb",
    "app/views/l/partials/facebook/_footer.html.erb",
    "app/views/l/partials/facebook/_head.html.erb",
    "app/views/l/partials/facebook/_header.html.erb",
    "app/views/l/partials/facebook/_integration.html.erb",
    "app/views/l/users/_form.html.erb",
    "app/views/l/users/_submenu.erb",
    "app/views/l/users/_tooltip.html.erb",
    "app/views/l/users/destroy.js.erb",
    "app/views/l/users/edit.html.erb",
    "app/views/l/users/index.html.erb",
    "app/views/l/users/new.html.erb",
    "app/views/l/users/show.html.erb",
    "lib/generators/l/facebook/facebook_generator.rb",
    "lib/generators/l/facebook/templates/ca-bundle.crt",
    "lib/generators/l/facebook/templates/devise.rb",
    "lib/generators/l/facebook/templates/facebook/index.html.erb",
    "lib/generators/l/facebook/templates/facebook_controller.rb",
    "lib/generators/l/facebook/templates/initializer.rb",
    "lib/generators/l/facebook/templates/omniauth_callbacks_controller.rb",
    "lib/generators/l/facebook/templates/routes.rb",
    "lib/generators/l/facebook/templates/user_methods.rb",
    "lib/generators/l/facebook/templates/users_migration.rb",
    "lib/generators/l/galleries/galleries_generator.rb",
    "lib/generators/l/galleries/templates/galleries.rb",
    "lib/generators/l/galleries/templates/gallery_photos.rb",
    "lib/generators/l/l/l_generator.rb",
    "lib/generators/l/l/templates/application_controller.rb",
    "lib/generators/l/l/templates/application_helper.rb",
    "lib/generators/l/l/templates/locales/admin/pl.yml",
    "lib/generators/l/l/templates/locales/devise.en.yml",
    "lib/generators/l/l/templates/locales/devise.pl.yml",
    "lib/generators/l/l/templates/locales/en.yml",
    "lib/generators/l/l/templates/locales/pl.yml",
    "lib/generators/l/l/templates/roles.rb",
    "lib/generators/l/l/templates/roles_users.rb",
    "lib/generators/l/l/templates/routes.rb",
    "lib/generators/l/l/templates/setup_mail.rb",
    "lib/generators/l/l/templates/user_model.rb",
    "lib/generators/l/l/templates/users.rb",
    "lib/generators/l/l/templates/views/application/404.html.erb",
    "lib/generators/l/l/templates/views/application/index.html.erb",
    "lib/generators/l/l/templates/views/application/search.html.erb",
    "lib/generators/l/l/templates/views/devise/confirmations/new.html.erb",
    "lib/generators/l/l/templates/views/devise/mailer/confirmation_instructions.html.erb",
    "lib/generators/l/l/templates/views/devise/mailer/reset_password_instructions.html.erb",
    "lib/generators/l/l/templates/views/devise/mailer/unlock_instructions.html.erb",
    "lib/generators/l/l/templates/views/devise/passwords/edit.html.erb",
    "lib/generators/l/l/templates/views/devise/passwords/new.html.erb",
    "lib/generators/l/l/templates/views/devise/registrations/edit.html.erb",
    "lib/generators/l/l/templates/views/devise/registrations/new.html.erb",
    "lib/generators/l/l/templates/views/devise/sessions/new.html.erb",
    "lib/generators/l/l/templates/views/devise/shared/_errors.html.erb",
    "lib/generators/l/l/templates/views/devise/shared/_links.erb",
    "lib/generators/l/l/templates/views/devise/unlocks/new.html.erb",
    "lib/generators/l/mobile/mobile_generator.rb",
    "lib/generators/l/module/module_generator.rb",
    "lib/generators/l/module/templates/_filter.html.erb",
    "lib/generators/l/module/templates/_form.html.erb",
    "lib/generators/l/module/templates/_submenu.html.erb",
    "lib/generators/l/module/templates/_tooltip.html.erb",
    "lib/generators/l/module/templates/controller.rb",
    "lib/generators/l/module/templates/edit.html.erb",
    "lib/generators/l/module/templates/index.html.erb",
    "lib/generators/l/module/templates/new.html.erb",
    "lib/generators/l/module/templates/show.html.erb",
    "lib/generators/l/news/news_generator.rb",
    "lib/generators/l/news/templates/news.rb",
    "lib/generators/l/newsletter/newsletter_generator.rb",
    "lib/generators/l/newsletter/templates/_newsletter.erb",
    "lib/generators/l/newsletter/templates/newsletter/confirmation.html.erb",
    "lib/generators/l/newsletter/templates/newsletter/send_mail.html.erb",
    "lib/generators/l/newsletter/templates/newsletter_mails.rb",
    "lib/generators/l/page/page_generator.rb",
    "lib/generators/l/page/templates/pages.rb",
    "lib/generators/l/views/views_generator.rb",
    "lib/l.rb",
    "lib/l/controllers/exceptions_rescues.rb",
    "lib/l/generators/actions.rb",
    "lib/l/rails.rb",
    "lib/l/rails/engine.rb",
    "lib/l/string_extension.rb",
    "lib/l/version.rb",
    "lib/middleware/flash_session_cookie_middleware.rb",
    "public/swfupload.swf",
    "vendor/assets/images/admin/1000ideas_creative_agency.png",
    "vendor/assets/images/admin/array_down.gif",
    "vendor/assets/images/admin/array_up.gif",
    "vendor/assets/images/admin/cancel.png",
    "vendor/assets/images/admin/icons.png",
    "vendor/assets/images/admin/select-array.gif",
    "vendor/assets/images/admin/tooltip-arr.png",
    "vendor/assets/images/ajax-loader.gif",
    "vendor/assets/images/ajax-loader.png",
    "vendor/assets/images/ceebox/cee-close-btn.png",
    "vendor/assets/images/ceebox/cee-next-btn.gif",
    "vendor/assets/images/ceebox/cee-next-btn.png",
    "vendor/assets/images/ceebox/cee-prev-btn.gif",
    "vendor/assets/images/ceebox/cee-prev-btn.png",
    "vendor/assets/images/ceebox/loader.gif",
    "vendor/assets/images/icons-18-black.png",
    "vendor/assets/images/icons-18-white.png",
    "vendor/assets/images/icons-36-black.png",
    "vendor/assets/images/icons-36-white.png",
    "vendor/assets/images/lightbox/close.png",
    "vendor/assets/images/lightbox/loading.gif",
    "vendor/assets/images/lightbox/next.png",
    "vendor/assets/images/lightbox/prev.png",
    "vendor/assets/images/swfupload_button.png",
    "vendor/assets/images/uploadify-cancel.png",
    "vendor/assets/javascripts/admin/admin.js",
    "vendor/assets/javascripts/admins.js",
    "vendor/assets/javascripts/html5shiv.js",
    "vendor/assets/javascripts/jquery.mobile.js",
    "vendor/assets/javascripts/jquery.uploadify.js",
    "vendor/assets/javascripts/lightbox.js.erb",
    "vendor/assets/javascripts/swfobject.js",
    "vendor/assets/stylesheets/admin/activities.css.scss",
    "vendor/assets/stylesheets/admin/admin.css.scss",
    "vendor/assets/stylesheets/admin/admin_login.css.scss",
    "vendor/assets/stylesheets/admin/layout.css.scss",
    "vendor/assets/stylesheets/admin/layout/custom-forms.css.scss",
    "vendor/assets/stylesheets/admin/layout/filter.css.scss",
    "vendor/assets/stylesheets/admin/layout/forms.css.scss",
    "vendor/assets/stylesheets/admin/layout/gallery_photos.css.scss",
    "vendor/assets/stylesheets/admin/layout/send_mail.css.scss",
    "vendor/assets/stylesheets/admin/layout/sort.css.scss",
    "vendor/assets/stylesheets/admin/layout/switcher.css.scss",
    "vendor/assets/stylesheets/admin/layout/tables.css.scss",
    "vendor/assets/stylesheets/admin/layout/tabs.css.scss",
    "vendor/assets/stylesheets/admin/style.css.scss",
    "vendor/assets/stylesheets/admins.css",
    "vendor/assets/stylesheets/ceebox.css",
    "vendor/assets/stylesheets/common.css",
    "vendor/assets/stylesheets/jquery.mobile.css",
    "vendor/assets/stylesheets/jquery_ui/jquery.ui.core.css",
    "vendor/assets/stylesheets/jquery_ui/jquery.ui.dialog.css",
    "vendor/assets/stylesheets/jquery_ui/jquery.ui.tabs.css",
    "vendor/assets/stylesheets/jquery_ui/jquery.ui.theme.css",
    "vendor/assets/stylesheets/lazy.scss",
    "vendor/assets/stylesheets/lightbox.scss",
    "vendor/assets/stylesheets/style.css",
    "vendor/assets/stylesheets/uploadify.css",
    "vendor/assets/swf/uploadify.swf"
  ]
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Gem for lazy programmers"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<highline>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<highline>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<highline>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

