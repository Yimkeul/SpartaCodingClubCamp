//
//  LoginView.swift
//  TeamProject
//
//  Created by iOS study on 4/28/25.
//

import UIKit

import SnapKit
import Then

final class LoginView: UIView, UITextFieldDelegate {
    
    // MARK: - Properties
    
    weak var delegate: LoginViewContollerProtocol?
    
    // MARK: 
    
    private let loginPageTitle = UILabel().then {
        $0.text = "안녕하세요.\nGodRide입니다."
        $0.textColor = .label
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.textColor = .label
        $0.font = UIFont.fontGuide(.LoginTitle)
    }
    
    private let loginPageDescription = UILabel().then {
        $0.text = "서비스 이용을 위해 로그인을 해주세요."
        $0.textAlignment = .left
        $0.textColor = UIColor.asset(.gray2)
        $0.font = UIFont.fontGuide(.LoginDescription)
    }
    
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력하세요"
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor.asset(.gray4)
        $0.font = UIFont.fontGuide(.LoginPlaceholder)
        $0.autocapitalizationType = .none /// 첫글자 대문자 설정 해제
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요"
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor.asset(.gray4)
        $0.font = UIFont.fontGuide(.LoginPlaceholder)
        $0.isSecureTextEntry = true /// 입력된 텍스트를 보이지 않게 설정
        $0.autocapitalizationType = .none /// 첫글자 대문자 설정 해제
        $0.textContentType = .password
    }
    
    private let loginButton = UIButton(type: .system).then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.asset(.main)
        $0.titleLabel?.font = UIFont.fontGuide(.LoginButtonText)
        $0.layer.cornerRadius = 5
    }
    
    private let signUpButton = UIButton(type: .system).then {
        let attrubutedString = NSAttributedString(
            string: "회원가입하기",
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: UIColor.asset(.gray3),
                .font: UIFont.fontGuide(.LoginSignUpText)
            ]
        )
        $0.setAttributedTitle(attrubutedString, for: .normal)
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        setLayout()
        textFieldSetupDelegate()
        buttonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Helper
    
    private func setUp() {
        self.backgroundColor = .systemBackground
    }
    
    private func setLayout() {
        self.addSubviews(loginPageTitle, loginPageDescription, idTextField, passwordTextField, loginButton, signUpButton)
        
        loginPageTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(220)
            make.leading.equalToSuperview().inset(40)
        }
        
        loginPageDescription.snp.makeConstraints { make in
            make.top.equalTo(loginPageTitle.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(40)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(loginPageDescription.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(45)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(45)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func textFieldSetupDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    /// 리턴 키 눌렀을 때 키보드 내리기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /// 확장을 사용하여 영어, 숫자, 특수문자만 입력 가능하도록 바꿈
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == idTextField {
            let allowCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz0123456789")
            if string.rangeOfCharacter(from: allowCharacters.inverted) != nil {
                return false
            }
        } else if textField == passwordTextField {
            let allowCharacters = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=[]{}|;':\",.<>/?`~")
            if string.rangeOfCharacter(from: allowCharacters.inverted) != nil {
                return false
            }
        }
        return true
    }
    
    /// 아이디와 비밀번호를 가져오는 메서드
    func getId() -> String? {
        return idTextField.text
    }
    
    func getPassword() -> String? {
        return passwordTextField.text
    }
    
    /// 아이디, 비밀번호 자동완성용 메서드
    func setId(_ id: String) {
        idTextField.text = id
    }
    
    func setPassword(_ password: String) {
        passwordTextField.text = password
    }
    
    func buttonAction() {
        signUpButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods

    @objc private func signupButtonTapped() {
        delegate?.signUpButtonTapped()
    }
    
    @objc private func loginButtonTapped() {
        delegate?.loginButtonTapped()
    }
    
}
