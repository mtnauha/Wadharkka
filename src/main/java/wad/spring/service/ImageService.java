package wad.spring.service;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import wad.spring.domain.Image;

public interface ImageService {
    
    @PreAuthorize("isAuthenticated()")
    public void addImage(byte[] imagefile, String username);
    
    @PreAuthorize("isAuthenticated()")
    public void addImage(byte[] imagefile, String description, String username);
    
    @PreAuthorize("isAuthenticated()")
    public void addComment(Long imageId, String comment);
    
    public Image getImage(Long imageId);
    
    public byte[] getImageFile(Long imageId);
    
    public Image getProfileImage(String username);
    
    public void setProfileImage(String username, Long imageId);
    
    public List<Image> getImages(String userName);
}
