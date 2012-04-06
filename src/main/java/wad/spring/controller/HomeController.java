package wad.spring.controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import wad.spring.domain.User;
import wad.spring.service.UserService;

@Controller
public class HomeController {

    @Autowired
    UserService secureService;

    @RequestMapping(value = "/home")
    public String home(Model model) {
        secureService.executeFreely();

        return "home";
    }
    
    @RequestMapping(value = "/register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        
        return "register";
    }

    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public String postUser(@Valid @ModelAttribute("user") User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user";
        }

        if(secureService.addUser(user)) {
            return "redirect:/home";
        } else {
            return "redirect:/home";
        }
    }

    @RequestMapping(value = "/must-be-authenticated")
    public String mustAuth() {
        secureService.executeOnlyIfAuthenticated();
        return "home";
    }

    @RequestMapping(value = "/must-be-admin")
    public String mustAdmin() {
        secureService.executeOnlyIfAuthenticatedAsLecturer();
        return "home";
    }
}
