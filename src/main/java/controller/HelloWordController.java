package controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloWordController {
    @RequestMapping("/home")
    public String sayHello(){
        return "index";
    }
}
