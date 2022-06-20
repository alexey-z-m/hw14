import UIKit

class ViewController: UIViewController {
    
    private let _tabBarController = UITabBarController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTabBar()
    }
    
    func setupTabBar() {
        let firstViewController = UINavigationController(rootViewController: OtherViewController())
        firstViewController.title = "All Photos"
        firstViewController.tabBarItem.image = UIImage(systemName: Strings.firstIconName)
        let secondViewController = UINavigationController(rootViewController: OtherViewController())
        secondViewController.title = "For You"
        secondViewController.tabBarItem.image = UIImage(systemName: Strings.secondIconName)
        let albumViewController = AlbumViewController()
        albumViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        let thirdViewController = UINavigationController(rootViewController: albumViewController)
        thirdViewController.navigationBar.prefersLargeTitles = true
        thirdViewController.title = "Albums"
        thirdViewController.tabBarItem.image = UIImage(systemName: Strings.thirdIconName)
        let fourthViewController = UINavigationController(rootViewController: OtherViewController())
        fourthViewController.title = "Search"
        fourthViewController.tabBarItem.image = UIImage(systemName: Strings.fourthIconName)
        let views = [
            firstViewController,
            secondViewController,
            thirdViewController,
            fourthViewController]
        _tabBarController.setViewControllers(views, animated: false)
        _tabBarController.modalPresentationStyle = .fullScreen
        _tabBarController.tabBar.scrollEdgeAppearance = _tabBarController.tabBar.standardAppearance
        present(_tabBarController, animated: false)
    }
    
}

extension ViewController {
    enum Strings {
        static let firstIconName = "photo.fill.on.rectangle.fill"
        static let secondIconName = "heart.text.square.fill"
        static let thirdIconName = "rectangle.stack.fill"
        static let fourthIconName = "magnifyingglass"
    }
}
