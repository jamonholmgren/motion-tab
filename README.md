# MotionTab

**NOTE: MotionTab is deprecated and has been merged into the ProMotion project.

Easily create a UITabBar in a RubyMotion app.

## Installation

Add this line to your application's Gemfile:

    gem 'motion-tab'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-tab

## Usage

Basic usage (more documentation is forthcoming). In app/app_delegate.rb:

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
      viewController: CustomViewController.alloc.initWithCustomInit(true)
    }, {
      title: "Settings",
      icon: "settings.png",
      navigationController: true,
      viewController: SettingsViewController
    }
  ]

  tabBarController = MotionTab::TabBar.createTabBarControllerFromData(tabs)
  MotionTab::TabBar.select(tabBarController, title: "Settings")
  # MotionTab::TabBar.select(tabBarController, tag: 0) # Selects first tab

  @window.rootViewController = tabBarController
  @window.makeKeyAndVisible
end
```

### Tab Options
**systemIcon:** You can **not** customize the title if you use a system icon. You can find all of them here: http://developer.apple.com/library/ios/#documentation/userexperience/conceptual/mobilehig/UIElementGuidelines/UIElementGuidelines.html#pageNavigationLinks_bottom

**icon:** Uses an image found in /resources.

**title:** Custom title (only used if also using a custom icon). NOTE: setting self.title in a ViewController will override this value when you switch to that tab.

**navigationController:** Boolean. If true, wraps **viewController** in a UINavigationController.

**viewController:** The UIViewController class you want to load into the tab. You can also pass in an instantiated viewController.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
