package wad.spring.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import wad.spring.service.ImageService;

@Controller
public class ImageController {

    @Autowired
    private ImageService imageService;
    //ApplicationContext appContext = new ClassPathXmlApplicationContext("spring-context.xml");

    @RequestMapping(value = "/image/{imageId}", method = RequestMethod.GET)
    @ResponseBody
    public byte[] getImage(@PathVariable Long imageId) {

        byte[] tmp;

        tmp = imageService.getImageFile(imageId);

        return tmp;
    }

    @RequestMapping(value = "image", method = RequestMethod.POST)
    //@ResponseBody
    public void addImage(@RequestParam(value = "description", required = false) String description,
            @RequestParam(value = "filu", required = true) MultipartFile file, Principal principal) {

        System.out.println("****************************DOWEGETHERE*************************");
        System.out.println("**FILE** " + file);
        System.out.println("**DESC**" + description);

        //byte[] tmp = null;

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                if (description.isEmpty()) {
                    imageService.addImage(bytes, principal.getName());
                } else {
                    imageService.addImage(bytes, description, principal.getName());
                }

                //          tmp = bytes;
            } catch (IOException ex) {
                Logger.getLogger(DefaultController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        //return tmp;
    }

    @RequestMapping(value = "/image/{imageId}", method = RequestMethod.DELETE)
    public void deleteImage(@PathVariable Long imageId) {

        System.out.println("*****DELETE******");
        imageService.deleteImage(imageId);
    }

    @RequestMapping(value = "/image/getprofile/{username}", method = RequestMethod.GET)
    @ResponseBody
    public byte[] getProfileImage(@PathVariable String username) throws IOException {

        byte[] tmp = null;
        
        try {
            tmp = imageService.getProfileImage(username).getImagefile();
        }
        catch(Exception e) {
            System.out.println(e.getMessage());
        }

        return tmp;

        /*
         * byte[] tmp = null;
         *
         * try { tmp = imageService.getProfileImage(username).getImagefile();
         * System.out.println("***********IMAGESERVICE???*********"); return
         * tmp; } catch (Exception e) { System.out.println("***********IMAGE???"
         * + e + "*********"); FileSystemResource resource = new
         * FileSystemResource("/WEB-INF/resources/img/lolcat.jpeg"); // Resource
         * resource =
         * appContext.getResource("classpath:wad/spring/common/lolcat.jpeg");
         * System.out.println("***********" + tmp + "*********"); tmp =
         * IOUtils.toByteArray(resource.getInputStream());
         * System.out.println("***********" + tmp + "*********"); return tmp; }
         */
//        byte[] tmp = null;
//
//        if (tmp != null) {
//            return tmp;
//        } else {
//            System.out.println("***********IMAGE???*********");
//            FileSystemResource resource = new FileSystemResource("/WEB-INF/resources/img/lolcat.jpeg"); // Resource
//            resource =
//                    appContext.getResource("classpath:wad/spring/common/lolcat.jpeg");
//            System.out.println("***********" + tmp + "*********");
//            tmp =
//                    IOUtils.toByteArray(resource.getInputStream());
//            System.out.println("***********" + tmp + "*********");
//            return tmp;
//        }

    }
}
