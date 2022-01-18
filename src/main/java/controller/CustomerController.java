/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.SendMail;
import model.User;
import org.apache.commons.codec.binary.Hex;

/**
 *
 * @author gerencia
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/Customer/*"})
public class CustomerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String action = request.getPathInfo();
            CustomerDAO CustomerDB = new CustomerDAO();
            HttpSession session = request.getSession();
            SendMail mailPre = new SendMail();
            
            
//            session.setAttribute("islogin", false);
//            session.setAttribute("isMessLogout", false);
//            session.setAttribute("isMessBlocked", false);
//            session.setAttribute("isMessRejected", false);
//            session.setAttribute("isMessRegistered", false);
//            session.setAttribute("isMessNoRegistered", false);
//            session.setAttribute("isMessRecovered", false);
//            session.setAttribute("isMessNoRecovered", false);
            
            String resultado = "";
                    
            switch (action) {

                case "/access":
                    String email = request.getParameter("email");
                    String pass = request.getParameter("password");
                    boolean login =  CustomerDB.login(email,pass) && CustomerDB.validateStatusByEmail(email);
                    
                    if (login) {
                        User user = CustomerDB.getUserByEmail(email);
                        Customer customer = CustomerDB.getCustomerByEmail(email);
                        
                        session.setAttribute("user", user);
                        session.setAttribute("customer", customer);
                        session.setAttribute("isLogin", true);
                        session.setAttribute("isStart", false);
                        response.sendRedirect("/actioncustomer/access.jsp");
                    } else {
                        int count = (int) session.getAttribute("attempts");
                        if (count<2) {
                            count += 1;
                            session.setAttribute("attempts", count);
                            session.setAttribute("isMessRejected", true);
                            response.sendRedirect("/Views/login");
                        } else {
                            Customer customer = CustomerDB.getCustomerByEmail(email);
                            CustomerDB.locked(customer.getCuitCustomer());
                            session.setAttribute("isMesslocked", true);
                            response.sendRedirect("/Views/login");
                        }
                    }
                    break;
                    
                case "/register":
                    email = request.getParameter("email");
                    pass = request.getParameter("password");
                    String rePass = request.getParameter("passwordAgain");
                    String namesRepre = request.getParameter("namesRepre");
                    String celular = request.getParameter("celular");
                    String cuitCustomer = request.getParameter("cuitCustomer");
                    
                    boolean repeated = CustomerDB.repeated(pass, rePass);
                    
                    boolean duplicate = CustomerDB.duplicateCustomer(cuitCustomer);
                    
                    if (!repeated) {
                        session.setAttribute("isMessNoRepeteadPass", true);
                        response.sendRedirect("/Views/registration");
                        break;
                    }
                    
                    if (!duplicate) {
                        Long datetime = System.currentTimeMillis();
                        Timestamp dateCre = new Timestamp(datetime);
                        
                        Customer customer = CustomerDB.createCustomer(cuitCustomer,dateCre);
                        
                        CustomerDB.createUser(customer.getIdCustomer(), dateCre, email, namesRepre, celular, pass);
                        
                        Cookie myCookie = new Cookie("activated",Hex.encodeHexString(mailPre.createMB(pass)));
                        myCookie.setMaxAge(10800);//3 horas

                        String subject = "Registro realizado...";
                        String content = "<HTML><HEAD><TITLE></TITLE></HEAD><br>"
                        + "<BODY><p>Hola, "+namesRepre +", "
                        + "ante todo recibe un cordial saludo, y de nuestra parte<br>"
                        + "el agradecimiento por la confianza en nuestro sistema de gestion de proveedores.</p>"
                        + "<p>Para concluir los tramites para la empresa cuyo cuit es<br>"
                        + "el siguiente "+cuitCustomer+ " realizados en la fecha "+ dateCre+".</p>"
                        + "<p>Por favor confirma la cuenta de correo electrónico, para ello<br> "
                        + "agradecemos hacer clic en el siguiente link: <br>"
                        + "<a href=\"http://localhost:8090/actioncustomer/authenticationMail.jsp\" target=\"_blank\"><button type=\"button\" style=\"background-color: #04AA6D; border-radius: 5px;\">Confirmar</button></a></p>"
                        + "<p>Sin otro particular a que hacer referencia, sintiendos honrados de habernos elegido.<br>"
                        + "Nos despedimos, atentamente</p></BODY></HTML>";

                        String send = mailPre.goSendMail(email,subject,content);

                        session.setAttribute("validation", duplicate);
                        session.setAttribute("resultado", send);
                        session.setAttribute("isMessRegistered", true);
                        response.sendRedirect("/Views/registration");
                        } else {
                        session.setAttribute("validation", duplicate);
                        session.setAttribute("resultado", "No enviado");
                        session.setAttribute("isMessNoRegistered", true);
                        response.sendRedirect("/Views/registration");
                        }
                    
                    break;
                    
                case "/recover":
                    email = request.getParameter("email");
                    cuitCustomer = request.getParameter("cuitCustomer");
                    
                    boolean validate = CustomerDB.validate(cuitCustomer, email);
                    
                    if (validate) {
                        long datetime = System.currentTimeMillis();
                        Timestamp timestamp = new Timestamp(datetime);
                        User user = CustomerDB.getUserByEmail(email);
                        
                        String subject = "Correo validado...";
                        String content = "<HTML><HEAD><TITLE></TITLE></HEAD><br>"
                        + "<BODY><p>Hola, "+user.getNamesRepre() +", "
                        + "ante todo recibe un cordial saludo.</p>"
                        + "<p>Le damos, nuevamente, la bienvenida a nuestro sistema a usted y a la <br>"
                        + "empresa cuyo cuit es "+cuitCustomer+ " y en representación de la cual actúa.</p>"
                        + "<p style=\"color:red; font-weight: bolder\">IMPORTANTE, Si usted no ha realizado este procedimiento, ignore este correo.</p>"
                        + "<p>El procedimiento de recuperación de la cuenta fue<br>"
                        + "realizado en la fecha siquiente "+ timestamp+".</p>"
                        + "<p>Para continuar, haga clic en el siguiente link: <br>"
                        + "<a href=\"http://localhost:8090/actioncustomer/changePassword.jsp\" target=\"_blank\"><button type=\"button\" style=\"background-color: #04AA6D; border-radius: 5px;\">Confirmar</button></a></p>"
                        + "<p>Sin otro particular a que hacer referencia, sintiendos honrados de continuar con nosotros.<br>"
                        + "Nos despedimos, atentamente</p></BODY></HTML>";

                        String send = mailPre.goSendMail(email,subject,content);
                        
                        session.setAttribute("validation", validate);
                        session.setAttribute("result", send);
                        session.setAttribute("isMessRecovered", true);
                        response.sendRedirect("/Views/recovery");
                        } else {
                        session.setAttribute("validation", validate);
                        session.setAttribute("result", "No enviado");
                        session.setAttribute("isMessNoRecovered", true);
                        response.sendRedirect("/Views/recovery");
                        }
                    
                    break;
                    
                case "/logout":
                    session.setAttribute("islogin",false);
                    session.setAttribute("isStart", true);
                    session.setAttribute("isMesgLogout", true);
                    session.invalidate();
                    response.sendRedirect("../index.jsp");
                    break;
                    
                case "changePassword":
                    response.sendRedirect("/actioncustomer/changePassword.jsp");
                case "/404":
                    //response.sendRedirect("/views/registration.jsp");
                    break;
                
                case "/500":
                    //response.sendRedirect("/views/registration.jsp");
                    break;
                default:
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
