package mvc.controller;

import mvc.formregistration.Gender;
import mvc.formregistration.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
    private static final String[] countries = {"Vietnam", "United States", "Germany"};

    @RequestMapping(value = "/register")
    public String showRegistrationForm(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("gender", Gender.values());
        model.addAttribute("country", countries);

        return "helloWorld/userForm";
    }

    @RequestMapping(value = "/result")
    public String processUser(User user){

        return "helloWorld/userResult";
    }
}
