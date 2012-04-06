package wad.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import wad.spring.service.ImageService;

@Controller
@RequestMapping("/image")
public class ImageController {

    @Autowired
    private ImageService imageService;
    //ApplicationContext appContext = new ClassPathXmlApplicationContext("spring-context.xml");

    @RequestMapping(value = "getimage/{imageId}", method = RequestMethod.GET)
    @ResponseBody
    public byte[] getImage(@PathVariable Long imageId) {

        byte[] tmp;

        tmp = imageService.getImageFile(imageId);

        return tmp;
    }

    @RequestMapping(value = "getprofile/{username}", method = RequestMethod.GET)
    @ResponseBody
    public byte[] getProfileImage(@PathVariable String username) {

        byte[] tmp;
        tmp = imageService.getProfileImage(username).getImagefile();
        
        return tmp;

//        if (tmp != null) {
//            return tmp;
//        } else {
//            Resource resource = appContext.getResource("classpath:wad/spring/common/lolcat.jpeg");
//            InputStream is = resource.getInputStream();
//            return IOUtils.toByteArray(is);
//        }
    }
}
