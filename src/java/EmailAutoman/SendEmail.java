/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package EmailAutoman;

import dao.JobDAO;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import model.Apply;
import model.Company;
import model.Job;

/**
 *
 * @author ASUS
 */
public class SendEmail {

    public void sendMailVeri(String mail, String name, int token) {

        final String username = "nhanbtdevfe23@gmail.com";
        final String password = "vutc kizj tmap aqlz";
        String fromEmail = "nhanbtdevfe23@gmail.com";
        String toEmail = mail;
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        MimeMessage mgs = new MimeMessage(session);
        try {

            mgs.setFrom(new InternetAddress(fromEmail));
            mgs.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mgs.setSubject(" Authenticate account registration via Email");
            mgs.setText("Hello " + name + " ,\n"
                    + "\n"
                    + "We have received a request to verify your account. To complete the verification process, please enter the following 6-digit verification code on the verification page:\n"
                    + "\n"
                    + "Your verification code is: " + token + "\n"
                    + "\n"
                    + "This code will expire in 10 minutes.\n"
                    + "\n"
                    + "If you did not request this verification, please disregard this email or contact our support team.\n"
                    + "\n"
                    + "Thank you for using our service!\n"
                    + "\n"
                    + "Best regards,\n"
                    + "Customer Support Team\n"
                    + "easyjob@gmail.com\n"
                    + "easyjob.com");
            Transport.send(mgs);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public void sendMailChangePass(String mail, String name, int token) {

        final String username = "nhanbtdevfe23@gmail.com";
        final String password = "vutc kizj tmap aqlz";
        String fromEmail = "nhanbtdevfe23@gmail.com";
        String toEmail = mail;
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        MimeMessage mgs = new MimeMessage(session);
        try {

            mgs.setFrom(new InternetAddress(fromEmail));
            mgs.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mgs.setSubject(" Authenticate account change pass via Email");
            mgs.setText("Hello " + name + " ,\n"
                    + "\n"
                    + "We have received a request to verify your account. To complete the verification process, please enter the following 6-digit verification code on the verification page:\n"
                    + "\n"
                    + "Your verification code is: " + token + "\n"
                    + "\n"
                    + "This code will expire in 10 minutes.\n"
                    + "\n"
                    + "If you did not request this verification, please disregard this email or contact our support team.\n"
                    + "\n"
                    + "Thank you for using our service!\n"
                    + "\n"
                    + "Best regards,\n"
                    + "Customer Support Team\n"
                    + "easyjob@gmail.com\n"
                    + "easyjob.com");
            Transport.send(mgs);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public void sendCheckPass(String mail, int token) {

        final String username = "nhanbtdevfe23@gmail.com";
        final String password = "vutc kizj tmap aqlz";
        String fromEmail = "nhanbtdevfe23@gmail.com";
        String toEmail = mail;
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        MimeMessage mgs = new MimeMessage(session);
        try {

            mgs.setFrom(new InternetAddress(fromEmail));
            mgs.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mgs.setSubject("Request to change password !!!");
            mgs.setText("Your password change verification code is: " + token);
            Transport.send(mgs);
            System.out.println("Sent Magess");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public void sendBill(String mail, String name) {

        final String username = "nhanbtdevfe23@gmail.com";
        final String password = "vutc kizj tmap aqlz";
        String fromEmail = "nhanbtdevfe23@gmail.com";
        String toEmail = mail;
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        MimeMessage mgs = new MimeMessage(session);
        try {

            mgs.setFrom(new InternetAddress(fromEmail));
            mgs.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mgs.setText("Dear Customer " + name);
            mgs.setSubject("92 Library Dear notice of invoice for borrowing books at our library as follows.!!!");

            Multipart emailContent = new MimeMultipart();
            //
            MimeBodyPart textBodyPart = new MimeBodyPart();
            textBodyPart.setText(" Notice of successful book borrowing from 92 Library! ");
            MimeBodyPart pdfAttachment = new MimeBodyPart();
            pdfAttachment.attachFile("C:\\Users\\ASUS\\OneDrive\\Documents\\NetBeansProjects\\Bill92Library.pdf");

            // Attach Body Part
            emailContent.addBodyPart(textBodyPart);
            emailContent.addBodyPart(pdfAttachment);
            mgs.setContent(emailContent);

            Transport.send(mgs);
            System.out.println("Sent Magess");
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException ex) {
            Logger.getLogger(SendEmail.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void sendUpdateStatusCVApply(String mail, String name, Company com, Apply a) {

        final String username = "nhanbtdevfe23@gmail.com";
        final String password = "vutc kizj tmap aqlz";
        String fromEmail = "nhanbtdevfe23@gmail.com";
        String toEmail = mail;
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        MimeMessage mgs = new MimeMessage(session);
        try {

            mgs.setFrom(new InternetAddress(fromEmail));
            mgs.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mgs.setSubject("Hi " + name + ", " + "We send you notifications about your job application status updates.");

            mgs.setText("\n" + "Job Title: " + a.getJob().getTitle() + "\n" + "Job Position: " + a.getJob().getCategory().getCategoryName() + "\n" + "Company Name: " + a.getJob().getCompany().getNameCompany() + "\n" + "Address: " + a.getJob().getCompany().getAdd() + "\n" + "Date Application: " + a.getApplicationDate() + "\n" + "Review status: " + a.getStatus() + "\n" + "View more in here: " + "http://localhost:8080/easyjob/jobdetails?id=" + a.getJob().getJobID() + "\n" + "------------------------------------------------------------------------------------" + "\n" + "Thank you for using our system, hope you find a job that's right for you." + "\n" + "EasyJob team.");

            Transport.send(mgs);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public void BlockUserMail(String name, String mail) {

        final String username = "nhanbtdevfe23@gmail.com";
        final String password = "vutc kizj tmap aqlz";
        String fromEmail = "nhanbtdevfe23@gmail.com";
        String toEmail = mail;
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        MimeMessage mgs = new MimeMessage(session);
        try {

            mgs.setFrom(new InternetAddress(fromEmail));
            mgs.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mgs.setSubject("Hi " + name + ", " + "We send you notifications about your account status at EasyJob as follows:");

            mgs.setText("Your account has been locked for violating community standards, behavior and ethics. Your comment affects organizations, individuals or the state causing hostility and division. \n"
                    + "If you have any questions, please reply to this email so it can be processed if you feel unsatisfied. Best regards.");

            Transport.send(mgs);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
    
    
    
     public void UnBlockUserMail(String name, String mail) {

        final String username = "nhanbtdevfe23@gmail.com";
        final String password = "vutc kizj tmap aqlz";
        String fromEmail = "nhanbtdevfe23@gmail.com";
        String toEmail = mail;
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        MimeMessage mgs = new MimeMessage(session);
        try {

            mgs.setFrom(new InternetAddress(fromEmail));
            mgs.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mgs.setSubject("Hi " + name + ", " + "We send you notifications about your account status at EasyJob as follows:");

            mgs.setText("Your account has been unlocked. You can log back into the EasyJob system. Wish you have a good experience at EasyJob. Best regards.");

            Transport.send(mgs);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

}
