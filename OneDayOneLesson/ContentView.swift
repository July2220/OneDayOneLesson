//
//  ContentView.swift
//  OneDayOneLesson
//
//  Created by july on 2023/2/27.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @SceneStorage("ContentView.sentenceNumber") private var sentenceNumber = 0 //我用的是 @AppStorage
    @SceneStorage("ContentView.tapCount")  private var tapCount = 0 //我用的是 @AppStorage
    
    @State private var cnSentence = ""
    @State private var enSentence = ""
    @State private var renderedImage: Image?
    @Environment(\.displayScale) var displayScale
    
    let sentences = [
        Sentence(cn: "你从来就没成功过，还怕什么失败？", en: "You've never succeeded before, so what are you afraid of failing for?"),
        Sentence(cn: "一路上有你，苦一点也愿意，苦很多免谈。", en: "As long as you're with me, I'm willing to endure a little hardship. If it's too much, forget it."),
        Sentence(cn: "如果你不珍惜我，那么过了这个村，我在下一个村等你。", en: "If you don't treasure me, then when we pass this village, I'll be waiting for you in the next one."),
        Sentence(cn: "为什么家长只看分数？废话！难道他们看得懂题目？", en: "Why do parents only look at grades? Of course! Can they even understand the questions?"),
        Sentence(cn:  "心软不是病，回头才致命。", en: "Having a soft heart is not a disease, but turning back can be fatal.")
    ]
    
    var body: some View {
        ZStack {
            Color(red: 1.00, green: 0.95, blue: 0.86)
                .ignoresSafeArea()
            VStack {
                Spacer()
                TextView(text: "请点击「开始」按钮开始")
                    .opacity(tapCount == 0 ? 1 : 0)
                Spacer()
                TextView(text: cnSentence)
                Divider()
                TextView(text: enSentence)
                Spacer()
    
                
            LargeButton(title: "开始",
                        backgroundColor: Color(red: 0.99, green: 0.83, blue: 0.42),
                        foregroundColor: Color.white) {
                updateUI()
                tapCount += 1
                print("tapCount = \(tapCount)")
                print("sentenceNumber = \(sentenceNumber)")
                if sentenceNumber < sentences.count - 1 {
                    sentenceNumber += 1 }
                else {
                    sentenceNumber = 0
                }
            }
            
            LargeButton(title: "保存到相册",
                        backgroundColor: Color.white,
                        foregroundColor: Color(red: 0.99, green: 0.83, blue: 0.42)
            ) {
                let renderer = ImageRenderer(content: cardView)
                renderer.scale = displayScale
                if let uiImage = renderer.uiImage {
                    renderedImage = Image(uiImage: uiImage)
                    UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
                    }
                }
                .opacity(tapCount == 0 ? 0 : 1)
            }
        }
    }
    
    
    
    var cardView: some View {
        ZStack {
            Color(red: 1.00, green: 0.95, blue: 0.86)
                .ignoresSafeArea()
            VStack {
                TextView(text: cnSentence)
                Divider()
                TextView(text: enSentence)
            }
            .padding()
        }
        .frame(width: 340)
    }
    
    func updateUI() {
            cnSentence = sentences[sentenceNumber].cn
            enSentence = sentences[sentenceNumber].en
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/*
Button(action: {
    updateUI()
    sentenceNumber += 1
}) {
    Text("开始")
        .padding()
        .background(.white)
        .foregroundColor(Color(red: 0.23, green: 0.06, blue: 0.47))
        .font(.system(size: 30))
        .fontWeight(.heavy)
        .frame(width: 140)
}
.background(Color.white)
*/
/*
Button(action: {
    let renderer = ImageRenderer(content: cardView)
    renderer.scale = displayScale
    if let uiImage = renderer.uiImage {
        renderedImage = Image(uiImage: uiImage)
        UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
    }
}) {
    Text("保存到相册")
        .font(.system(size: 18))
        .fontWeight(.heavy)
        .foregroundColor(Color(red: 0.23, green: 0.06, blue: 0.47))
        .padding()
        .frame(width: 140)
}
.cornerRadius(25)
*/
