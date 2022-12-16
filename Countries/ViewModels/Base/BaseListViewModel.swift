//
//  BaseListViewModel.swift
//  Countries
//
//  Created by Andres Sancho on 16/12/22.
//

import Foundation

class BaseListViewModel<T>: BaseViewModel {
    
    var currentData: [T] = []
    
    /// Number of sections.
    ///
    /// - Returns: number of sections.
    func numberOfSections() -> Int {
        return 1
    }
    
    /// Number of rows in the section @section.
    ///
    /// - Parameter section: section.
    /// - Returns: number of rows.
    func numberOfRows(inSection section: Int) -> Int {
        return currentData.count
    }
    
    /// Return the object contained in the list at the indexpath.
    ///
    /// - Parameter atIndexPath: indexpath of the object.
    /// - Returns: ObjectType instance, this ObjectType usually is ViewModel.
    func object(atIndexPath indexPath: IndexPath) -> T {
        return currentData[indexPath.row]
    }
    
    var hasData: Bool {
        return currentData.count != 0
    }
    
    
}
