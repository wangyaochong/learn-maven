package com.example.learnpackage.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/testController")
public class TestController {
    @GetMapping("/testGet")
    public String testGet(){
        return "testGet";
    }
}
