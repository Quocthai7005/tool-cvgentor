package cvgentor.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cvgentor.com.model.CurriculumVitae;
import cvgentor.com.service.CategoryService;
import cvgentor.com.service.CurriculumVitaeService;
import cvgentor.com.utils.CvReader;

@Controller
public class HomeController {

    @Autowired
    CurriculumVitaeService curriVitaeService;

    @RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
    public String init(@ModelAttribute("model") ModelMap model) {
        model.addAttribute("curriVitaeList", curriVitaeService.listAll());
        return "Homepage";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about() {
        return "About";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "Login";
    }
    
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup() {
        return "Signup";
    }

    @RequestMapping(value = "/themes", method = RequestMethod.GET)
    public @ResponseBody ResponseEntity<List<CurriculumVitae>> getCurriculumVitaes(@RequestParam(name = "categoryId") Long categoryId) {
        List<CurriculumVitae> cvs = curriVitaeService.getByCategory(categoryId);
        return new ResponseEntity<>(cvs, HttpStatus.OK);
    }

    @RequestMapping(value = "/theme", method = RequestMethod.GET)
    public @ResponseBody ResponseEntity<String> getCurriculumVitae(@RequestParam(name = "cvId") Long cvId) {
        CurriculumVitae cvs = curriVitaeService.get(cvId);
        String html = CvReader.htmlReader(cvs.getPath());
        return new ResponseEntity<>(html, HttpStatus.OK);
    }

    @RequestMapping(value = "/editCurriVitae", method = RequestMethod.GET)
    public String editCurriculumVitae(@ModelAttribute("model") ModelMap model, @RequestParam(name = "cvId") Long cvId) {
        CurriculumVitae cvs = curriVitaeService.get(cvId);
        model.addAttribute("cv", cvs);
        return "UserCvEditPage";
    }
}
