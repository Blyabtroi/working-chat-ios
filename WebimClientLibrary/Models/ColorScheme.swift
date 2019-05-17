//

import UIKit

final class ColorScheme {
    
    // MARK: - Properties
    static let shared = ColorScheme()
    var schemeType: SchemeType
    
    // MARK: - Initialization
    private init() {
        if let settings = UserDefaults.standard.object(forKey: USER_DEFAULTS_NAME) as? [String : String] {
            if let rawValue = settings[UserDefaultsKey.colorScheme.rawValue],
                let option = SchemeType(rawValue: rawValue) {
                self.schemeType = option
            } else {
                self.schemeType = .light
            }
        } else {
            self.schemeType = .light
        }
    }
    
    // MARK: - Methods
    
    func navigationItemImage() -> UIImage {
        switch schemeType {
        case .light:
            return #imageLiteral(resourceName: "LogoWebimNavigationBar")
        case .dark:
            return #imageLiteral(resourceName: "LogoWebimNavigationBar_dark")
        }
    }
    
    func backButtonImage() -> UIImage {
        switch schemeType {
        case .light:
            return #imageLiteral(resourceName: "Back")
        case .dark:
            return #imageLiteral(resourceName: "Back_dark")
        }
    }
    
    func closeChatButtonImage() -> UIImage {
        switch schemeType {
        case .light:
            return #imageLiteral(resourceName: "Close")
        case .dark:
            return #imageLiteral(resourceName: "Close_dark")
        }
    }
    
    func scrollToBottomButtonImage() -> UIImage {
        switch schemeType {
        case .light:
            return #imageLiteral(resourceName: "ScrollToBottom")
        case .dark:
            return #imageLiteral(resourceName: "ScrollToBottom_dark")
        }
    }
    
    func keyboardAppearance() -> UIKeyboardAppearance {
        switch schemeType {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    // MARK: -
    enum SchemeType: String {
        case light = "classic"
        case dark = "dark"
    }
    
}

// MARK: -
struct SchemeColor {
    
    // MARK: - Properties
    private let classic: UIColor
    private let dark: UIColor
    
    // MARK: - Initialization
    init(classic: UIColor,
         dark: UIColor) {
        self.classic = classic
        self.dark = dark
    }
    
    // MARK: - Methods
    
    func color() -> UIColor {
        return colorWith(scheme: ColorScheme.shared.schemeType)
    }
    
    // MARK: Private methods
    private func colorWith(scheme: ColorScheme.SchemeType) -> UIColor {
        switch scheme {
        case .light:
            return classic
        case .dark:
            return dark
        }
    }
    
}
