# Motion::Tab

Easily create a UITabBar in a RubyMotion app.

## Installation

Add this line to your application's Gemfile:

    gem 'motion-tab'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-tab

## Usage

Basic usage (more documentation is forthcoming):

```ruby
def application(application, didFinishLaunchingWithOptions:launchOptions)
  @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

  tabs = [
    {
      systemIcon: UITabBarSystemItemContacts,
      navigationController: true,
      viewController: ContactsViewController
    }, {
      title: "Custom",
      icon: "custom.png",
      navigationController: false,
      viewController: CustomViewController
    }, {
      title: "Settings",
      icon: "settings.png",
      navigationController: true,
      viewController: SettingsViewController
    }
  ]

  @window.rootViewController = MotionTab::TabBar.createTabBarControllerFromData(tabs)
  @window.makeKeyAndVisible
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
