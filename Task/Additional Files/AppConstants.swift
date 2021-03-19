//
//  AppConstants.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 17.03.2021.
//

import Foundation

struct AppKeys {
    
    struct Strings {
        static let rights = "©2019 Tapsyr. Все права защищены."
        static let signUp = "Зарегистрироваться"
        static let notification = "Уже есть аккаунт?"
        static let signIn = "Войти"
        static let registration = "Регистрация"
        static let authorization = "Вход"
        static let email = "Email"
        static let password = "Пароль"
        static let emailPlaceholder = "Введите почту"
        static let passwordPlaceholder = "Введите пароль"
        static let next = "Далее"
        static let firstTitle = "Сортируйте отходы"
        static let secondTitle = "Вызовите водителя"
        static let thirdTitle = "Помогите планете"
        static let firstSubTitle = "Ознакомьтесь, что можно сдать и\n сортируйте отходы дома."
        static let secondSubtitle = "Вызовите водителя в удобное для вас\n время, и получите за это деньги."
        static let thirdSubtitle = "Сдавайте мусор на переработку,\n чтобы сохранить будущее."
        static let profile = "Профиль"
        static let settingProfile = "Редактировать данные"
    }
    
    struct Constants {
        static let tapsyrCollectionID = "tapsyrCollectionID"
        static let tapsyrTableID = "tapsyrTableID"
        static let profileTableHeight = 75
    }
}

let splashCount = [
    FirstCollectionViewCell.self,
    SecondCollectionViewCell.self,
    ThirdCollectionViewCell.self
]

let FIRST_PAGE_CELLID  = "FIRSTID"
let SECOND_PAGE_CELLID = "SECONDID"
let THIRD_PAGE_CELLID  = "THIRDID"

let PROFILE_CELLID = "PROFILEID"
