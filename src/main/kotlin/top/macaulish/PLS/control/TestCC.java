package top.macaulish.PLS.control;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/")
public class TestCC {

    @ResponseBody
    @RequestMapping(value = "/test.jsp",method = RequestMethod.GET)
    private String test(){
        return "test success";
    }
}
