package br.com.bruckner.hello.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    
    @GetMapping(value = "/")
    public String index(){
        return "index";
    }
}

