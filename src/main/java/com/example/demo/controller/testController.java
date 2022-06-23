package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class testController {
   @RequestMapping("/test")
   @ResponseBody
    public String hello(){
       return "hello,SpringBoot  --v1.0.0";
   }
}
