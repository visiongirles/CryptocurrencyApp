//
//  UIApp.swift
//  MoonCut
//
//  Created by Kate Sychenko on 12.05.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
