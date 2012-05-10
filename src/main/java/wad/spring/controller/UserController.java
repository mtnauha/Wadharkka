package wad.spring.controller;

import java.security.Principal;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import wad.spring.domain.User;
import wad.spring.service.ImageService;
import wad.spring.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private ImageService imageService;

    @RequestMapping(value = "user/home")
    public String home(Model model, Principal principal) {

        model.addAttribute("principalName", principal.getName());
        model.addAttribute("users", userService.listUsers());

        return "user/home";
    }

    @RequestMapping(value = "user/userlist")
    public String listUsers(Model model, Principal principal) {

        model.addAttribute("principalName", principal.getName());
        model.addAttribute("users", userService.listUsers());

        return "user/userlist";
    }

    @RequestMapping(value = "user/search")
    public String search(Model model, Principal principal) {

        model.addAttribute("principalName", principal.getName());
        model.addAttribute("users", userService.listUsers());

        return "user/search";
    }

    @RequestMapping(value = "user/profile/{username}", method = RequestMethod.GET)
    public String showUser(Model model, @PathVariable String username, Principal principal) {

        if (userService.getUser(username) != null) {
            model.addAttribute("user", userService.getUser(username));
            model.addAttribute("images", imageService.getImages(username));
            model.addAttribute("principalName", principal.getName());
            return "user/profile";
        } else {
            model.addAttribute("principalName", principal.getName());
            return "user/notfound";
        }
    }

    @RequestMapping(value = "/createuser", method = RequestMethod.POST)
    public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result) {
        if (result.hasErrors()) {
            return "register";
        }

        if (userService.addUser(user)) {
            return "redirect:/success";
        } else {
            return "redirect:/error";
        }
    }

    @RequestMapping(value = "user/profile", method = RequestMethod.GET)
    public String searchUser(@RequestParam(value = "username", required = true) String username) {
        return "redirect:/user/profile/" + username;
    }

    @RequestMapping(value = "user/profile/{username}/{imageId}", method = RequestMethod.GET)
    public String showImage(Model model, @PathVariable String username, @PathVariable Long imageId, Principal principal) {
        model.addAttribute("user", userService.getUser(username));
        model.addAttribute("image", imageService.getImage(imageId));
        model.addAttribute("principalName", principal.getName());
        return "user/image";
    }

    @RequestMapping(value = "user/profile/{username}/{imageId}/comment", method = RequestMethod.POST)
    public String sendComment(@RequestParam("comment") String comment, @PathVariable String username, @PathVariable Long imageId, Principal principal) {

        imageService.addComment(imageId, principal.getName() + ": " + comment);

        return "redirect:/user/profile/" + username + "/" + imageId;
    }
}
