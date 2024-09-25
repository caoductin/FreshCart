//
//  UIExtension.swift
//  FreshCart
//
//  Created by cao duc tin  on 17/7/24.
//


import SwiftUI

enum Gilroy: String {
    case regular = "Gilroy-Regular"
    case medium = "Gilroy-Medium"
    case semibold = "Gilroy-SemiBold"
    case bold = "Gilroy-Bold"
}

extension Font {
    
    static func customfont(_ font: Gilroy, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
    
    static var currentKeyWindow: UIWindow? {
          return UIApplication.shared
              .connectedScenes
              .filter { $0.activationState == .foregroundActive }
              .compactMap { $0 as? UIWindowScene }
              .first?.windows
              .first { $0.isKeyWindow }
      }
      
      // Top inset
      static var topInsets: Double {
          return Double(currentKeyWindow?.safeAreaInsets.top ?? 0.0)
      }
      
      // Bottom inset0
      static var bottomInsets: Double {
          return Double(currentKeyWindow?.safeAreaInsets.bottom ?? 0.0)
      }
      
      // Horizontal insets (left + right)
      static var horizontalInsets: Double {
          guard let safeAreaInsets = currentKeyWindow?.safeAreaInsets else { return 0.0 }
          return safeAreaInsets.left + safeAreaInsets.right
      }
      
      // Vertical insets (top + bottom)
      static var verticalInsets: Double {
          guard let safeAreaInsets = currentKeyWindow?.safeAreaInsets else { return 0.0 }
          return safeAreaInsets.top + safeAreaInsets.bottom
      }
    
}

extension Color {
    
    static var primaryApp: Color {
        return Color(hex: "53B175")
    
    }
    
    static var primaryText: Color {
        return Color(hex: "030303")
    }
    
    static var secondaryText: Color {
        return Color(hex: "828282")
    }
    
    static var textTitle: Color {
        return Color(hex: "7C7C7C")
    }
    
    static var placeholder: Color {
        return Color(hex: "B1B1B1")
    }
    
    static var darkGray: Color {
        return Color(hex: "4C4F4D")
    }
    
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB(12 -bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ShowButton: ViewModifier {
    @Binding var isShow: Bool
    
    public func body(content: Content) -> some View {
        
        HStack {
            content
            Button {
                isShow.toggle()
//                debugPrint(isShow)
            } label: {
                Image(systemName: !isShow ? "eye.fill" : "eye.slash.fill" )
                    .foregroundColor(.textTitle)
            }

        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corner:  UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corers: corner))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corers: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corers, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
