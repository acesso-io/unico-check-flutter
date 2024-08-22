//
//  UnicoLocale.swift
//  unico_check
//
//  Created by Bruno Corrêa on 22/08/24.
//

import Foundation

final class UnicoLocale {
    private let locale: LocaleTypes

    init(argument: Dictionary<String, Any>) {
        let rawLocale = argument[MethodConstants.SET_LOCALE_TYPES.rawValue] as? String

        switch rawLocale {
        case .some("EN_US"):
            self.locale = .EN_US

        case .some("ES_ES"):
            self.locale = .ES_ES

        case .some("ES_MX"):
            self.locale = .ES_MX

        case .some("PT_BR"), .none, .some(_):
            self.locale = .PT_BR

        }
    }

    func getLocale() -> LocaleTypes {
        return locale
    }
}
