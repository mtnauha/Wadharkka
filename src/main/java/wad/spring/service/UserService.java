package wad.spring.service;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import wad.spring.domain.User;

public interface UserService {

    @PreAuthorize("hasRole('admin')")
    public void executeOnlyIfAuthenticatedAsLecturer();

    @PreAuthorize("isAuthenticated()")
    public void executeOnlyIfAuthenticated();

    public void executeFreely();
    
    public boolean addUser(User user);
    
    public List<User> listUsers();
    
    public User getUser(String userName);
}
