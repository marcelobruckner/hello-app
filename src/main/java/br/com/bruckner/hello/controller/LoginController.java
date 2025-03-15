package br.com.bruckner.hello.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    
    @GetMapping(value = "/")
    public String index(){
        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/home")
    public String home() {
        return "home";  // Página após login bem-sucedido
    }

    @GetMapping(value = "/logout")
    public String logout(){
        return "index";
    }
}
