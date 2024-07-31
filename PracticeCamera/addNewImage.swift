//
//  addNewImage.swift
//  PracticeCamera
//
//  Created by Scholar on 7/31/24.
//

import SwiftUI

struct addNewImage: View {
    @State private var imageDisabled = true
    @State var isImagePickerShowing = false
    @State var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var processedImage: UIImage?
    var body: some View {
        VStack {
            Image(uiImage: selectedImage ?? UIImage(named: "camera")!)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200.0, height: 200.0)
            
            HStack{
                Button {
                    self.sourceType = .photoLibrary
                    isImagePickerShowing = true
                    imageDisabled = false
                    
                }label: {
                    Text("Select a photo")
                }
                Button {
                    self.sourceType = .camera
                    isImagePickerShowing = true
                    imageDisabled = true
                } label: {
                    Text("Take a photo")
                }

                .padding()
            }
            Button("Remove Background") {
                imageDisabled = true
                testBackgroundRemoval()
            }.disabled(imageDisabled)
            
        }
        .sheet(isPresented: $isImagePickerShowing) {
            ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
        }
    }
    func testBackgroundRemoval() {
        if let image = selectedImage {
            print("Testing background removal...")
            let backgroundRemoved = image.removeBackground(returnResult: .finalImage)
            if let resultImage = backgroundRemoved {
                selectedImage = resultImage
                
                print("Background removal succeeded")
            } else {
                print("Background removal failed")
            }
        } else {
            print("No image selected for removal")
        }
    }
    
    
}

    

#Preview {
    addNewImage()
}
