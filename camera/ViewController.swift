//
//  ViewController.swift
//  camera
//
//  Created by Javier Rodríguez Valentín on 08/10/2021.
//

import UIKit

//Es immportante que en el info.plist añadamos una línea más con Privacy - Camera Usage Description, y metiendo el string que queramos que saque cuando vayamos a iniciar por primera vez la app ya que lo que nos preguntará es si queremos darle los permisos de acceso a la cámara

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var img: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.backgroundColor = .lightGray
        
        cameraBtn.setTitle("Capturar", for: .normal)
        cameraBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
        cameraBtn.tintColor = .white
        cameraBtn.layer.cornerRadius = 12
        cameraBtn.backgroundColor = UIColor(red: 98/255, green: 128/255, blue: 18/255, alpha: 1)
        cameraBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
        cameraBtn.titleLabel?.textAlignment = .center
        
        
    }

    @IBAction func cameraBtnAc(_ sender: Any) {
        let grabber = UIImagePickerController()
        //Le digo el tipo de fuente que utiliza
        grabber.sourceType = .camera
        //le digo que puede editar
        grabber.allowsEditing = true
        //tenemos que implementar protocolos
        grabber.delegate = self
        
        //presentar el capturador
        present(grabber, animated: true, completion: nil)
        
    
    }
    
    //Protocolo delegado del picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Protocolo delegado del picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        picker.dismiss(animated: true, completion: nil)
    
        //el guard es como un if let (binding) pero con condición negativa y con retorno
        guard let images = info[.editedImage] as? UIImage else {
            print("Imagen no capturada")
            return
        }
        
        img.image = images
        
    }
    
    
}

