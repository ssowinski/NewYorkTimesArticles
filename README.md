# NewYorkTimes Articles - MVVM and Coordinator Pattern.

We have MVC with two view controllers ArticlesListViewController and DetailsViewController.
In AppDelegate we have set ArticlesListViewController (embed in UINavigationController ) as a window?.rootViewController 



## What is a coordinator?

> So what is a coordinator? A coordinator is an object that bosses one or more view controllers around. Taking all of the driving logic out of your view controllers, and moving that stuff one layer up is gonna make your life a lot more awesome.

> Ultimately, coordinators are just an organizational pattern. There’s no library you can use for coordinators because they’re so simple. There’s no pod you can install and nothing to subclass from. There’s not even really a protocol to conform to. Rather than being a weakness, this is a strength of using a pattern like coordinators: it’s just your code, with no dependencies.

Soroush Khanlou [Coordinators Redux](http://khanlou.com/2015/10/coordinators-redux/) 


### Coordinator class

```
class Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}
```

### Localization

1. In Project/Info/Localizations we shoud have selected Use Base Internationalization 
2. In Project/Info/Localizations add Polish 
3. Create new Strings File Localizable.strings
4. Select new file and in File inspector (right panel) select Locacize... and add Polish
5. Add key-value "tweet_list_title" = "Lista tweet-ów"; 
6. Use NSLocalizedString("tweet_list_title", comment: "")
7. Or create extension 

```
extension String {
    var localize: String {
        return NSLocalizedString(self, comment: "")
    }
}
```




You can also, with the user’s permission, gain secure access to the user’s account infor‐ mation through the ACAccountStore class (part of the Accounts framework). Using this, along with the SLRequest class, your app can construct and post a message directly, without passing through the message composition interface. The ACAccount‐
832 | Chapter 20: Mail and Messages
Store class can manipulate accounts in other ways as well, without violating the user’s privacy.
