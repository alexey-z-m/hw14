import UIKit
import SnapKit
class AlbumViewController: UIViewController {
    static let identifier = "AlbumViewController"
    
    private var mainCollectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section,Item>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureCollectionView()
        configureDataSourse()
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
        title = "Albums"
    }
    
    func configureCollectionView() {
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: generateLayout()
        )
        collectionView.register(
            MyAlbumsCollectionViewCell.self,
            forCellWithReuseIdentifier: MyAlbumsCollectionViewCell.identifier
        )
        collectionView.register(
            SharedAlbumsCollectionViewCell.self,
            forCellWithReuseIdentifier: SharedAlbumsCollectionViewCell.identifier
        )
        collectionView.register(
            TableCollectionViewCell.self,
            forCellWithReuseIdentifier: TableCollectionViewCell.identifier
        )
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: AlbumViewController.identifier, withReuseIdentifier: HeaderView.identifier)
        mainCollectionView = collectionView
        view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.right.bottom.equalToSuperview()
        }
    }
    
    func generateMyAlbumsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(180),
            heightDimension: .absolute(230)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 5)
        
        let groupeSize = NSCollectionLayoutSize(
            widthDimension: .absolute(180),
            heightDimension: .absolute(460)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupeSize, subitems: [item])
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(35)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind:AlbumViewController.identifier,
            alignment: .top
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func generateSharedAlbumsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(180),
            heightDimension: .absolute(230)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 5)
        
        let groupeSize = NSCollectionLayoutSize(
            widthDimension: .absolute(180),
            heightDimension: .absolute(230)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupeSize, subitems: [item])
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(35)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind:AlbumViewController.identifier,
            alignment: .top
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func generateTableLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(50)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        let groupeSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(150)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupeSize, subitems: [item])
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind:AlbumViewController.identifier,
            alignment: .top
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .myAlbums:
                return self.generateMyAlbumsLayout()
            case .sharedAlbums:
                return self.generateSharedAlbumsLayout()
            case .table:
                return self.generateTableLayout()
            }
        }
        return layout
    }
    
    func configureDataSourse() {
        dataSource = UICollectionViewDiffableDataSource<Section,Item>(
            collectionView: mainCollectionView) {(
                colectionView: UICollectionView,
                indexPath: IndexPath,
                item: Item) -> UICollectionViewCell? in
                let sectionType = Section.allCases[indexPath.section]
                switch sectionType {
                case .myAlbums:
                    guard let cell = self.mainCollectionView.dequeueReusableCell(
                        withReuseIdentifier: MyAlbumsCollectionViewCell.identifier,
                        for: indexPath
                    ) as? MyAlbumsCollectionViewCell else {
                        fatalError()
                    }
                    cell.configure(with: item)
                    return cell
                case .sharedAlbums:
                    guard let cell = self.mainCollectionView.dequeueReusableCell(
                        withReuseIdentifier: SharedAlbumsCollectionViewCell.identifier,
                        for: indexPath
                    ) as? SharedAlbumsCollectionViewCell else {
                        fatalError()
                    }
                    cell.configure(with: item)
                    return cell
                case .table:
                    guard let cell = self.mainCollectionView.dequeueReusableCell(
                        withReuseIdentifier: TableCollectionViewCell.identifier,
                        for: indexPath
                    ) as? TableCollectionViewCell else {
                        fatalError()
                    }
                    cell.configure(with: item)
                    return cell
                }
            }
        
        dataSource.supplementaryViewProvider = {(
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath
        ) -> UICollectionReusableView? in
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderView.identifier,
                for: indexPath
            ) as? HeaderView else {
                fatalError()
            }
            supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
            return supplementaryView
        }
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot,animatingDifferences: false)
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section,Item> {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
        snapshot.appendSections([Section.myAlbums])
        snapshot.appendItems(Model.itemForCollection(section: Section.myAlbums), toSection: Section.myAlbums)
        snapshot.appendSections([Section.sharedAlbums])
        snapshot.appendItems(Model.itemForCollection(section: Section.sharedAlbums), toSection: Section.sharedAlbums)
        snapshot.appendSections([Section.table])
        snapshot.appendItems(Model.itemForCollection(section: Section.table), toSection: Section.table)
        return snapshot
    }
}
