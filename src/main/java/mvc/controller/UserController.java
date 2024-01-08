package mvc.controller;

import mvc.formregistration.Gender;
import mvc.formregistration.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

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
    public String processUser(User user, HttpSession session){
        //save data to session
        session.setAttribute("username", user.getName());
        return "helloWorld/userResult";
    }
    @RequestMapping(value = "/session-test")
    public String showSessionTest(Model model, HttpServletRequest request){
        //get data from session
        String username = (String) request.getSession().getAttribute("username");
        model.addAttribute("username", username);
        return "helloWorld/session";
    }
    @RequestMapping(value = "/remove-session")
    public String removeSession(Model model, HttpServletRequest request){
        //remove data from session
        request.getSession().removeAttribute("username");
        return "redirect:/session-test";
    }
}
