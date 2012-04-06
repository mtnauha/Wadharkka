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
    private UserService secureService;
    @Autowired
    private ImageService imageService;

    @RequestMapping(value = "/home")
    public String home(Model model, Principal principal) {

        model.addAttribute("principalName", principal.getName());
        model.addAttribute("users", secureService.listUsers());

        return "default/home";
    }

    @RequestMapping(value = "profile/{username}", method = RequestMethod.GET)
    public String showUser(Model model, @PathVariable String username, Principal principal) {
        model.addAttribute("user", secureService.getUser(username));
        model.addAttribute("images", imageService.getImages(username));
        model.addAttribute("principalName", principal.getName());
        return "default/profile";
    }

    @RequestMapping(value = "profile/{username}/{imageId}", method = RequestMethod.GET)
    public String showImage(Model model, @PathVariable String username, @PathVariable Long imageId, Principal principal) {
        model.addAttribute("user", secureService.getUser(username));
        model.addAttribute("image", imageService.getImage(imageId));
        model.addAttribute("principalName", principal.getName());
        return "default/image";
    }

    @RequestMapping(value = "userlist")
    public String listUsers(Model model, Principal principal) {

        model.addAttribute("principalName", principal.getName());
        model.addAttribute("users", secureService.listUsers());

        return "default/userlist";
    }

    @RequestMapping(value = "search")
    public String search(Model model, Principal principal) {

        model.addAttribute("principalName", principal.getName());
        model.addAttribute("users", secureService.listUsers());

        return "default/search";
    }

    @RequestMapping(value = "profile/setprofile/{imageId}")
    public String setProfileImage(@PathVariable Long imageId, Principal principal) {

        imageService.setProfileImage(principal.getName(), imageId);

        return "redirect:/default/profile/" + principal.getName();
    }

//    @RequestMapping(value = "profile/form", method = RequestMethod.POST)
//    public String handleFormUpload(@RequestParam("description") String description,
//            @RequestParam("files[]") MultipartFile file, Principal principal) {
//        
//        System.out.println("****************************DOWEGETHERE*************************");
//
//        if (!file.isEmpty()) {
//            try {
//                byte[] bytes = file.getBytes();
//                
//                if(description.isEmpty())
//                    imageService.addImage(bytes, principal.getName());
//                else
//                    imageService.addImage(bytes, description, principal.getName());
//            } catch (IOException ex) {
//                Logger.getLogger(DefaultController.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            
//            return "redirect:" + principal.getName();
//        } else {
//            return "redirect:" + principal.getName();
//        }
//    }
    @RequestMapping(value = "profile/form", method = RequestMethod.POST)
    public String handleFormUpload(@RequestParam(value = "filu", required = false) MultipartFile file1, Principal principal) {

        System.out.println("****************************DOWEGETHERE*************************");

        System.out.println("**FILE** " + file1);

        return "redirect:" + principal.getName();
    }

    @RequestMapping(value = "profile/form", method = RequestMethod.GET)
    public String handleFormUpload() {

        System.out.println("****************************GETFORM!*************************");

        return "default/profile";
    }

    @RequestMapping(value = "profile/{username}/{imageId}/comment", method = RequestMethod.POST)
    public String sendComment(@RequestParam("comment") String comment, @PathVariable String username, @PathVariable Long imageId) {

        imageService.addComment(imageId, comment);

        return "redirect:/default/profile/" + username + "/" + imageId;
    }
}
