package api_gateway.gateway.web.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class RootController {

    @GetMapping("/")
    public String health(){
        return "I'm healthy!";
    }
}
