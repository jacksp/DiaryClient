package com.softserve.tc.diaryclient.controller;

import java.util.Random;

import org.jasypt.util.password.PasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.softserve.tc.diary.entity.User;
import com.softserve.tc.diary.webservice.DiaryService;
import com.softserve.tc.diaryclient.service.MailSender;
import com.softserve.tc.diaryclient.webservice.diary.DiaryServicePortProvider;

@Controller
public class ForgotAccountController {
    
    private DiaryService port;
    
    @Autowired
    public ForgotAccountController(DiaryServicePortProvider diaryServicePortProvider) {
        port = diaryServicePortProvider.getPort();
    }
    
    @RequestMapping(value = "/forgotAccount", method = RequestMethod.GET)
    public @ResponseBody String forgotAccountPOST(@RequestParam("email") String email, Model model) {
        User user = port.getUserByEmail(email);
        String result = null;
        if (user != null) {
            String newPassword = randomPassword();

            port.updateUserPassword(user, newPassword);;
            String [] message = messageForgotAccount(user.getNickName(), newPassword);
            MailSender mail = MailSender.getInstance();
            mail.setParameters(message[0], message[1], email);
            Thread t = new Thread(mail);
            t.start(); 
            result = "message was successfully sended";
        } else {
            result = "incorect email or this email not not supported for any account";
        }
        return  result;
    }
    
    private String [] messageForgotAccount(String nickName, String password) {
        String [] message = new String[2];
        message[0] = "The Diary. Your account properties";
        message[1] = "Reminder your access data for account on The Diary." + "\n" 
                + "Important!!! " + "\n"
                + "login: " + nickName + "\n"
                + "Password: " + password + "\n" + "\n"
                + "Please change this password after successful access to your account";
        return message;
    }
    
    private String randomPassword() {
        char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890".toCharArray();
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 12; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String output = sb.toString();
        return output;
    }

}
