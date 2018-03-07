# NewYorkTimes Articles - MVVM and Coordinator Pattern.

In this project I'm going to use only apple frameworks, without any external libraries. The aim of the project is to present the application architecture.
In real life project I recommend to use Cocoapods, in this kind of apps very helpfull are: [Alamofire](https://github.com/Alamofire/Alamofire), [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON), [Reachability](https://github.com/ashleymills/Reachability.swift) etc.

## What is a coordinator?

> So what is a coordinator? A coordinator is an object that bosses one or more view controllers around. Taking all of the driving logic out of your view controllers, and moving that stuff one layer up is gonna make your life a lot more awesome.

> Ultimately, coordinators are just an organizational pattern. There’s no library you can use for coordinators because they’re so simple. There’s no pod you can install and nothing to subclass from. There’s not even really a protocol to conform to. Rather than being a weakness, this is a strength of using a pattern like coordinators: it’s just your code, with no dependencies.

Soroush Khanlou [Coordinators Redux](http://khanlou.com/2015/10/coordinators-redux/) 


### Coordinator class

```
class Coordinator {

    var childCoordinators: [Coordinator] = []

    weak var parentCoordinator: Coordinator?
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?, parentCoordinator: Coordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }

    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }

    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}
```

Now we should create coordinator for every view controller 
- ArticleListCoordinator
- ArticleDetailsCoordinator
and main, entry coordinator AppCoordinator.

General, when we create ViewController in Coordinator, we set Coordinator as VC's delegate.
Now Coordinator can handled our app flow. 
e.g ArticleListViewController delegate function in ArticleListCoordinator

```
extension ArticleListCoordinator: ArticleListViewControllerDelegate {

    func didSelectArticle(_ url: URL) {
        let articlesDetailsCoordinator = ArticlesDetailsCoordinator(navigationController: navigationController, parentCoordinator: self)
        articlesDetailsCoordinator.start(url: url)
        addChildCoordinator(articlesDetailsCoordinator)
    }
}

```

To avoid delegate form child to parent coordinator, I add week refernce to parent coordinator. It is helpfull, when we want remove self form parent child coordinators.

## Networking




## Protocols 

> You can use protocol extensions to provide a default implementation to any method or computed property requirement of that protocol. If a conforming type provides its own implementation of a required method or property, that implementation will be used instead of the one provided by the extension.

### Adding Constraints to Protocol Extensions

When you define a protocol extension, you can specify constraints that conforming types must satisfy before the methods and properties of the extension are available (using a generic where clause)


```
protocol AlertPresenting {
    func showAlert(_ title: String, message: String)
}

extension AlertPresenting where Self: UIViewController {

    func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

```


## Localization

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
