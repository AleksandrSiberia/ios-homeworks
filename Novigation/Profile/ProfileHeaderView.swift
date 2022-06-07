//
//  ProfileHeaderView.swift
//  Novigation
//
//  Created by Александр Хмыров on 03.06.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    private lazy var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView()
        avatarImageView.backgroundColor = .systemGray4
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "sun")
        avatarImageView.layer.borderWidth = 3
        return avatarImageView
    }()

    private lazy var topStack: UIStackView = {
        var topStack: UIStackView = UIStackView()
        topStack.axis = .vertical
        topStack.spacing = 4
        topStack.distribution = .fillEqually
        topStack.translatesAutoresizingMaskIntoConstraints = false
        return topStack
    }()

    private lazy var fullNameLabel: UILabel = {
        var titleLabel: UILabel = UILabel()
        titleLabel.text = "Доброе Солнышко"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    //  titleLabel.backgroundColor = .red
        return titleLabel
    }()

    private lazy var statusLabel: UILabel = {
        var statusLabel: UILabel = UILabel()
        statusLabel.text = "Дарю всем свет"
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        return statusLabel
    }()

    private lazy var statusTextField: UITextField = {
        var statusTextField: UITextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.backgroundColor = .white
        statusTextField.delegate = self
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        return statusTextField
    }()

    private lazy var setStatusButton: UIButton = {
        var statusButton: UIButton = UIButton()
        statusButton.backgroundColor = .blue
 //       statusButton.clipsToBounds = true
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitle("Поменять статус", for: .normal)
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.cornerRadius = 12
        return statusButton
    }()

    private lazy var statusText: String = {
        return ""
    }()

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
    }

    func setFirtResponder() {
        self.statusTextField.becomeFirstResponder()
    }

    private func setupView() {
        self.addSubview(self.avatarImageView)
        self.addSubview(self.topStack)
        self.topStack.addArrangedSubview(self.fullNameLabel)
        self.topStack.addArrangedSubview(self.statusLabel)
        self.addSubview(self.statusTextField)
        self.addSubview(self.setStatusButton)


        NSLayoutConstraint.activate([

            self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 100),

            self.topStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            self.topStack.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            self.topStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.topStack.bottomAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: -18),

            self.statusTextField.topAnchor.constraint(equalTo: topStack.bottomAnchor),
            self.statusTextField.leadingAnchor.constraint(equalTo: topStack.leadingAnchor),
            self.statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.statusTextField.heightAnchor.constraint(equalToConstant: 40),

            self.setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 18),
            self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
         ])
    }



    @objc private func buttonPressed() {
        statusLabel.text = statusText

        print(statusText)
    }

    @objc private func statusTextChanged(_ TextField: UITextField) {
        let statusTextField: UITextField = TextField
        if let text = statusTextField.text  {
            statusText = text
        }
    }

}

extension ProfileHeaderView: UITextFieldDelegate {

}


