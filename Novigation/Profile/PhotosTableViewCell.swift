//
//  PhotosTableViewCell.swift
//  Novigation
//
//  Created by Александр Хмыров on 18.06.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private enum Constraints {
        static let NumberItemInLine: CGFloat = 4
    }



    private lazy var labelCollectionPhoto: UILabel = {
        var labelCollectionPhoto = UILabel()
        labelCollectionPhoto.text = "  Label"
        labelCollectionPhoto.translatesAutoresizingMaskIntoConstraints = false
        labelCollectionPhoto.numberOfLines = 0
        return labelCollectionPhoto
    }()


    private lazy var collectionFlowLayout: UICollectionViewFlowLayout = {
        var collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        collectionFlowLayout.minimumInteritemSpacing = 8
        collectionFlowLayout.scrollDirection = .horizontal
        return collectionFlowLayout
    }()

    private lazy var photoCollectionView: UICollectionView = {
        var photoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self 
        photoCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        photoCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.nameCollectionCell)
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return photoCollectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(photoCollectionView)
        self.addSubview(labelCollectionPhoto)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.labelCollectionPhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            self.labelCollectionPhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.labelCollectionPhoto.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.labelCollectionPhoto.bottomAnchor.constraint(equalTo: self.photoCollectionView.topAnchor),


            self.photoCollectionView.topAnchor.constraint(equalTo: self.labelCollectionPhoto.bottomAnchor),
            self.photoCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.photoCollectionView.heightAnchor.constraint(equalToConstant: self.frame.width / 3 + 10 ),
            self.photoCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
         ])
    }
}



extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.nameCollectionCell, for: indexPath) as? PhotosCollectionViewCell else {
            let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell }

        cell.clipsToBounds = true
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        cell.setupImage(arrayPhoto[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let spacingItem = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        let sectionInsetAll = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero

        let neededWidth = collectionView.frame.width - (Constraints.NumberItemInLine - 1) * spacingItem - sectionInsetAll.left - sectionInsetAll.right

        let widthItem = floor (neededWidth / Constraints.NumberItemInLine)

        return CGSize(width: widthItem, height: widthItem)
    }
}
