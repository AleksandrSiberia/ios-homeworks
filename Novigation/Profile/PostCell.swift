//
//  PostCell.swift
//  Novigation
//
//  Created by Александр Хмыров on 15.06.2022.
//

import UIKit

class PostCell: UITableViewCell {

    private lazy var authorLabel: UILabel = {
        var authorLabel = UILabel()
        authorLabel.text = "AleksandrSiberia"
        authorLabel.backgroundColor = .white
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.numberOfLines = 0
        return authorLabel
    }()

    private lazy var postImage: UIImage = {
        var postImage = UIImage()
        return postImage
    }()

    private lazy var postImageView: UIImageView = {
        var postImageView = UIImageView(image: postImage)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.backgroundColor = .black
        return postImageView
    }()

    private lazy var descriptionLabel: UILabel = {
        var descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.backgroundColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "descriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabel"
        return descriptionLabel
    }()

    private lazy var likesLabel: UILabel = {
        var likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.backgroundColor = .white
        likesLabel.numberOfLines = 0
        likesLabel.text = "Likes: 240"
        return likesLabel
    }()

    private lazy var viewsLabel: UILabel = {
        var viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.backgroundColor = .white
        viewsLabel.numberOfLines = 0
        viewsLabel.text = "Views: 3120"
        return viewsLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.backgroundColor = .red

        self.addSubview(authorLabel)
        self.addSubview(postImageView)
        self.addSubview(descriptionLabel)
        self.addSubview(likesLabel)
        self.addSubview(viewsLabel)

        NSLayoutConstraint.activate( [
            self.authorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.postImageView.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 12),
            self.postImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.postImageView.heightAnchor.constraint(equalTo: self.widthAnchor),

            self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.likesLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.likesLabel.trailingAnchor.constraint(equalTo: self.viewsLabel.leadingAnchor),
            self.likesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),

            self.viewsLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16),
            self.viewsLabel.leadingAnchor.constraint(equalTo: self.likesLabel.trailingAnchor),
            self.viewsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.viewsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }

    func setup(this post: ModelPost) {
        self.authorLabel.text = post.author
        self.postImageView.image = UIImage(named: post.image)
        self.descriptionLabel.text = post.description
        self.likesLabel.text = String(post.likes)
        self.viewsLabel.text = String(post.views)
            }
}

