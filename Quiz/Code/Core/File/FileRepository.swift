//
//  Copyright 2024 Roman Likhachev
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//  

import Foundation

protocol FileRepository {
    
    /**
     * Save text with content from external storage to local storage. For example, the user has created questions, we save the file with the questions in local storage.
     * For permanent access to the file.
     */
    func saveTextToLocalStorage(fileName: String, fileContents: String) -> String?
    
    /**
     * Reading text with content from local storage. For example, we read text to create a database from it.
     */
    func readTextFromFile(fileName: String) -> String
    
    /**
     * Returns the file name from the URL.
     */
    func getFileName(uri: String) -> String
}
