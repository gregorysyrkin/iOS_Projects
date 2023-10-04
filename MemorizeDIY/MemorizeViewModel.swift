//
//  MemorizeViewModel.swift
//  MemorizeDIY
//
//  Created by Greg on 16.09.23.
//

import Foundation


class MemorizeViewModel: ObservableObject {
    static var themeModel = ThemeModel()
    
    static func createMemorizeModel() -> MemorizeModel<String> {
//        return MemorizeModel(MemorizeViewModel.themeModel.activeTheme.size) {
        return MemorizeModel(2) {
            idx in MemorizeViewModel.themeModel.activeTheme.icons[idx]
        }
    }
    
    
    @Published var memorizeModel = createMemorizeModel()
    
    
    //INTENTS
    
    func handleCardClick(_ id: String) {
        memorizeModel.handleCardClick(id)
    }
    
    func startNewGame() {
        MemorizeViewModel.themeModel = ThemeModel(except: MemorizeViewModel.themeModel.activeTheme.name)
        memorizeModel = MemorizeViewModel.createMemorizeModel()
        }
    }
