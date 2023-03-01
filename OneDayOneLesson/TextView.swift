//
//  TextView.swift
//  OneDayOneLesson
//
//  Created by july on 2023/2/27.
//

import SwiftUI

struct TextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 30))
            .bold()
            .foregroundColor(Color(red: 0.18, green: 0.22, blue: 0.25))
            .padding(.horizontal)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "Join Stack Overflow to find the best answer to your technical question, help others answer theirs.")
    }
}
