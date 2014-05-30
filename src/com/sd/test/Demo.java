package com.sd.test;

import java.io.File;

import jodd.mail.Email;
import jodd.mail.EmailMessage;
import jodd.mail.SendMailSession;
import jodd.mail.SmtpSslServer;

public class Demo {
	public static void main(String[] args) {
		Email email = Email.create();
		email.addMessage(new EmailMessage("dddd","ddddd"));
		email.addText("这里写的是Test");
		email.from("349439391@qq.com").to("349439391@qq.com");
		email.subject("我的主题我做主");
		
		SendMailSession mailSession = new SmtpSslServer("smtp.qq.com","349439391@qq.com", "li15200790631@").createSession();
		mailSession.open();
		mailSession.sendMail(email);
		mailSession.close();
		System.out.println("发送成功!...");
	}
}
