package wad.spring.service;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import wad.spring.domain.User;

public interface UserService {

    //@PreAuthorize("hasRole('admin')")
    
    //@PreAuthorize("isAuthenticated()")

    public void populateRepository();
    
    public boolean addUser(User user);
    
    public List<User> listUsers();
    
    public User getUser(String userName);
}
