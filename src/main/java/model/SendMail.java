/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import org.apache.commons.codec.binary.Hex;

/**
 *
 * 
 * @author gerencia
 */
public class SendMail {
    
    public String goSendMail(String toMail, String subject, String content) {
    final String fromMail = "";  //configurar usuario y clave segun el caso SendMail.java
    final String pass = ""; //configurar usuario y clave segun el caso SendMail.java    
    Properties props = new Properties();

    props.put ("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
    props.put ("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
    props.put ("mail.smtp.starttls.enable", "true"); //Para conectar de manera segura al servidor SMTP
    props.put ("mail.smtp.port", "587"); //El puerto SMTP seguro de Google

    Session session = Session.getDefaultInstance(props);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromMail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
            message.setSubject(subject);
            message.setContent(content,"text/html");
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", fromMail, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            return "El correo ha sido enviado...";
        } catch (MessagingException me) {
            me.printStackTrace();   //Si se produce un error
        }
        return "no enviado";
    }
    
    public byte[] createMB(String pass){
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(pass.getBytes());
            byte[] mb = md.digest();
            
            return mb;
        } catch (NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        byte[] mb = null;
        return mb;
    }
}
