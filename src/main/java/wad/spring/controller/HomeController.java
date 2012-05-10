package wad.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import wad.spring.domain.User;
import wad.spring.service.UserService;

@Controller
public class HomeController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/home")
    public String home(Model model) {
        userService.populateRepository();

        return "home";
    }

    @RequestMapping(value = "/register")
    public String register(Model model) {
        model.addAttribute("user", new User());

        return "register";
    }

    @RequestMapping(value = "/success")
    public String success(Model model) {
        return "success";
    }

    @RequestMapping(value = "/error")
    public String error(Model model) {
        return "error";
    }

}
