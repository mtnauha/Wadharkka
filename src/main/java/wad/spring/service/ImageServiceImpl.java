/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package wad.spring.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import wad.spring.domain.Image;
import wad.spring.domain.User;
import wad.spring.repository.ImageRepository;
import wad.spring.repository.UserRepository;

/**
 *
 * @author mtnauha
 */

@Service
public class ImageServiceImpl implements ImageService{
    
    @Autowired
    ImageRepository imageRepository;
    
    @Autowired
    UserRepository userRepository;

    @Override
    @Transactional
    public void addImage(byte[] imagefile, String username) {
        User user = userRepository.findByUsername(username);
        Image image = new Image();
        
        image.setImagefile(imagefile);
        user.addImage(image);
        userRepository.save(user);
    }
    
    @Override
    @Transactional
    public void addImage(byte[] imagefile, String description, String username) {
        User user = userRepository.findByUsername(username);
        Image image = new Image();
        
        image.setImagefile(imagefile);
        image.setDescription(description);
        user.addImage(image);
        userRepository.save(user);
    }
    
    @Override
    @Transactional
    public void addComment(Long imageId, String comment) {
        Image image = imageRepository.findById(imageId);
        image.getComments().add(comment);
        imageRepository.save(image);
    }

    @Override
    public byte[] getImageFile(Long imageId) {
        return imageRepository.findOne(imageId).getImagefile();
    }
    
    @Override
    public Image getImage(Long imageId) {
        return imageRepository.findOne(imageId);
    }
    
    @Override
    public Image getProfileImage(String username) {
        if(userRepository.findByUsername(username).getProfileImage() == null)
            return null;
        return userRepository.findByUsername(username).getProfileImage();
    }
    
    @Override
    @Transactional
    public void setProfileImage(String username, Long imageId) {
        User user = userRepository.findByUsername(username);
        
        user.setProfileImage(imageId);
    }
    
    @Override
    public List<Image> getImages(String userName) {
        return userRepository.findByUsername(userName).getImages();
    }
    
    @Override
    @Transactional
    public void deleteImage(Long imageId) {
        Image image = imageRepository.findById(imageId);
        
        User user = image.getUser();
        user.getImages().remove(image);
        userRepository.save(user);
    }
    
}
