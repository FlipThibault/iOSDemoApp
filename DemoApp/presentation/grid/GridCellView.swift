import Foundation
import UIKit

class GridCellView : UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.ErrorMessages.notImplementedInitWithCoder)
    }
    
    lazy var titleLabel : UILabel = {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        return label
    }()
}

