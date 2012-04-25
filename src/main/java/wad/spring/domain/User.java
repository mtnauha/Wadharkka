package wad.spring.domain;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.eclipse.persistence.annotations.CascadeOnDelete;

@Entity(name = "USERS")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;
    @Size(min=4, message="Email is not valid")
    private String email;
    @NotNull(message = "Username cannot be empty!")
    @Column(unique = true)
    private String username;
    private String password;
    @ManyToMany(cascade = CascadeType.ALL)
    private List<Role> roles;
    @OneToMany(mappedBy = "user", orphanRemoval=true, cascade = {CascadeType.ALL})
    @CascadeOnDelete
    private List<Image> images;
    private Image profileImage;
    private boolean hasProfileImage = false;
    
    public void addImage(Image image) {
        if (!images.contains(image)) {
            images.add(image);
        }

        image.setUser(this);
    }

    public Image getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(Long imageId) {
        for (Image i : images) {
            if (i.getId() == imageId) {
                this.profileImage = i;
                hasProfileImage = true;
            }
        }
    }

    public boolean isHasProfileImage() {
        return hasProfileImage;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}