//
//  ErrorView.swift
//  News
//
//  Created by Shinhyuk on 2022/05/07.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack{
            Image(systemName: "antenna.radiowaves.left.and.right.slash")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(Color.red)
                .padding(50)

            Text("API Communication Error")
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
