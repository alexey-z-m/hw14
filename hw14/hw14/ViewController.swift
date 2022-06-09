import UIKit
class OtherViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
    }
}

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    private let _tabBarController = UITabBarController()
    func setupTabBar() {
        let firstViewController = UINavigationController(rootViewController: OtherViewController())
        firstViewController.title = "All Photos"
        firstViewController.tabBarItem.image = UIImage(systemName: "photo.fill.on.rectangle.fill")
        let secondViewController = UINavigationController(rootViewController: OtherViewController())
        secondViewController.title = "For You"
        secondViewController.tabBarItem.image = UIImage(systemName: "heart.text.square.fill")
        let albumViewController = AlbumViewController()
        albumViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        let thirdViewController = UINavigationController(rootViewController: albumViewController)
        thirdViewController.navigationBar.prefersLargeTitles = true
        thirdViewController.title = "Albums"
        thirdViewController.tabBarItem.image = UIImage(systemName: "rectangle.stack.fill")
        let fourthViewController = UINavigationController(rootViewController: OtherViewController())
        fourthViewController.title = "Search"
        fourthViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        let views = [firstViewController,secondViewController,thirdViewController,fourthViewController]
        _tabBarController.setViewControllers(views, animated: false)
        _tabBarController.modalPresentationStyle = .fullScreen
        _tabBarController.tabBar.scrollEdgeAppearance = _tabBarController.tabBar.standardAppearance
        present(_tabBarController, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        setupTabBar()
    }
    
}
