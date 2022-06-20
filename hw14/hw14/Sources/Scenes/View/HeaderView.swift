//
//  HeaderView.swift
//  hw14
//
//  Created by Panda on 15.06.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let identifier = "HeaderView"
    let viewLine = UIView()
    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        viewLine.backgroundColor = .systemGray4
        addSubview(viewLine)
        viewLine.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            make.left.equalToSuperview().offset(0)
            make.height.equalTo(1)
        }
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview().offset(10)
        }
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    }
}
