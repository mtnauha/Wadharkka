package wad.spring.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import wad.spring.service.ImageService;
import wad.spring.service.UserService;

@Controller
@RequestMapping("/default")
public class DefaultController {

    @Autowired
    private UserService userService;
    @Autowired
    private ImageService imageService;

    @RequestMapping(value = "/home")
    public String home(Model model, Principal principal) {

        model.addAttribute("principalName", principal.getName());
        model.addAttribute("users", userService.listUsers());

        return "default/home";
    }

    @RequestMapping(value = "profile/{username}", method = RequestMethod.GET)
    public String showUser(Model model, @PathVariable String username, Principal principal) {

        if (userService.getUser(username) != null) {
            model.addAttribute("user", userService.getUser(username));
            model.addAttribute("images", imageService.getImages(username));
            model.addAttribute("principalName", principal.getName());
            return "default/profile";
        } else {
            model.addAttribute("principalName", principal.getName());
            return "default/notfound";
        }
    }

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public String searchUser(@RequestParam(value = "username", required = true) String username) {
        return "redirect:/default/profile/" + username;
    }

    @RequestMapping(value = "profile/{username}/{imageId}", method = RequestMethod.GET)
    public String showImage(Model model, @PathVariable String username, @PathVariable Long imageId, Principal principal) {
        model.addAttribute("user", userService.getUser(username));
        model.addAttribute("image", imageService.getImage(imageId));
        model.addAttribute("principalName", principal.getName());
        return "default/image";
    }

    @RequestMapping(value = "userlist")
    public String listUsers(Model model, Principal principal) {

        model.addAttribute("principalName", principal.getName());
        model.addAttribute("users", userService.listUsers());

        return "default/userlist";
    }

    @RequestMapping(value = "search")
    public String search(Model model, Principal principal) {

        model.addAttribute("principalName", principal.getName());
        model.addAttribute("users", userService.listUsers());

        return "default/search";
    }

    @RequestMapping(value = "profile/setprofile/{imageId}")
    public String setProfileImage(@PathVariable Long imageId, Principal principal) {

        imageService.setProfileImage(principal.getName(), imageId);

        return "redirect:/default/profile/" + principal.getName();
    }

    @RequestMapping(value = "profile/{username}/{imageId}/comment", method = RequestMethod.POST)
    public String sendComment(@RequestParam("comment") String comment, @PathVariable String username, @PathVariable Long imageId) {

        imageService.addComment(imageId, comment);

        return "redirect:/default/profile/" + username + "/" + imageId;
    }
}
