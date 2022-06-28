//
//  ProfileHeaderView.swift
//  Novigation
//
//  Created by Александр Хмыров on 03.06.2022.
//

import UIKit

final class ProfileHeaderView: UITableViewHeaderFooterView {

    private lazy var startAvatarPosition: CGPoint = {
        var startAvatarPosition = CGPoint()
        return startAvatarPosition
    }()


    private lazy var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView()
        avatarImageView.backgroundColor = .systemGray4
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderWidth = 1
        avatarImageView.isUserInteractionEnabled = true
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
        titleLabel.text = "AleksandrSiberia"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return titleLabel
    }()

    private lazy var statusLabel: UILabel = {
        var statusLabel: UILabel = UILabel()
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

    private var viewForAnimation: UIView = {
        var viewForAnimation = UIView()
        viewForAnimation.translatesAutoresizingMaskIntoConstraints = false
        viewForAnimation.isHidden = true
        viewForAnimation.layer.opacity = 0.5
        return viewForAnimation
    }()

    private var buttonOffAnimation: UIButton = {
        var buttonOffAnimation = UIButton()
        buttonOffAnimation.translatesAutoresizingMaskIntoConstraints = false
        buttonOffAnimation.isHidden = true
        buttonOffAnimation.setImage(UIImage(named: "k"), for: .normal)
        buttonOffAnimation.layer.cornerRadius = 20
        buttonOffAnimation.layer.opacity = 0.5
        buttonOffAnimation.layer.masksToBounds = true
        buttonOffAnimation.addTarget(self, action: #selector(buttonOffAnimationTarget), for: .touchUpInside)
        return buttonOffAnimation
    }()


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
        self.setupGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
            }

    private func setupGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGestureRecognizer(_:)))
        self.avatarImageView.addGestureRecognizer(tapGestureRecognizer) }

    func setFirtResponder() {
        self.statusTextField.becomeFirstResponder()
    }

    private func setupView() {
        self.topStack.addArrangedSubview(self.fullNameLabel)
        self.topStack.addArrangedSubview(self.statusLabel)

        [topStack, statusTextField, setStatusButton,viewForAnimation, buttonOffAnimation, avatarImageView].forEach({self.addSubview($0)})
    }


    private func setupConstraints() {
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
        self.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),

        self.viewForAnimation.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        self.viewForAnimation.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),

        self.buttonOffAnimation.topAnchor.constraint(equalTo: self.viewForAnimation.topAnchor, constant: 14),
        self.buttonOffAnimation.trailingAnchor.constraint(equalTo: self.viewForAnimation.trailingAnchor, constant: -14),
        self.buttonOffAnimation.widthAnchor.constraint(equalToConstant: 40),
        self.buttonOffAnimation.heightAnchor.constraint(equalToConstant: 40)


        ])
    }

    private func basicAnimation() {
        print(avatarImageView.frame)
        startAvatarPosition = self.avatarImageView.center
        let screenMain = UIScreen.main.bounds
        let scale = UIScreen.main.bounds.width
        self.avatarImageView.layer.masksToBounds = false
        self.avatarImageView.layer.borderWidth = 0
        self.viewForAnimation.isHidden = false
        self.buttonOffAnimation.isHidden = false
        print(scale)

        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseInOut) {
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.center = CGPoint(x: screenMain.width / 2.0, y: screenMain.height / 2.0)
            self.avatarImageView.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.viewForAnimation.backgroundColor = .black

        }
    }

   
    @objc private func handleTapGestureRecognizer(_ gesture: UITapGestureRecognizer) {
        basicAnimation()
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
    @objc private func buttonOffAnimationTarget() {
        print(#function)

        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseInOut) {
            self.avatarImageView.center = self.startAvatarPosition
            self.avatarImageView.layer.cornerRadius =  50
            self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.viewForAnimation.backgroundColor = nil

        }
        completion: { _ in
            self.avatarImageView.layer.borderWidth = 1
            self.avatarImageView.layer.cornerRadius = 50
            self.avatarImageView.layer.masksToBounds = true
            self.viewForAnimation.isHidden = true
            self.buttonOffAnimation.isHidden = true
        }
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
}


