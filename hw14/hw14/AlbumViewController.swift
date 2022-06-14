import UIKit
import SnapKit
class AlbumViewController: UIViewController {

    private var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        title = "Albums"
        setupCollectionView ()
        view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.right.bottom.equalToSuperview()
        }
    }
    
    func setupCollectionView () {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let size = view.frame.width
        layout.estimatedItemSize = CGSize(
            width: size - 20,
            height: size + 60
        )
        mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCollectionView.register(MyAlbumsCollectionViewCell.self, forCellWithReuseIdentifier: MyAlbumsCollectionViewCell.identifier)
        
        
        mainCollectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CartFooterCollectionReusableView")
        mainCollectionView.showsVerticalScrollIndicator = true
        //mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let models = Model.getModels()
        return models.count
    }
}

extension AlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let models = Model.getModels()
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MyAlbumsCollectionViewCell.identifier,
            for: indexPath
        ) as? MyAlbumsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: models[indexPath.section].albums)
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CartFooterCollectionReusableView", for: indexPath)
        headerView.backgroundColor = .green
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return headerView
        
//        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header().identifier, for: indexPath) as! Header
//        cell.conf()
//        return cell
    }
}

extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
    }
}



class Header: UICollectionReusableView {
    public let identifier = "Header"
    let label: UILabel = {
       var label = UILabel()
        label.textColor = .black
        label.text = "qwe"
        return label
    }()
    
    func conf() {
        backgroundColor = .green
        addSubview(label)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
//        label.snp.makeConstraints { make in
//            make.left.top.right.bottom.equalToSuperview()
//        }
        label.frame = bounds
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
