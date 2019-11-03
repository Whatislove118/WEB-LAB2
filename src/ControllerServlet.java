import java.io.IOException;
import java.io.PrintWriter;

public class ControllerServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
      String y = request.getParameter("textY");
      boolean checkX=false;
      boolean checkR=false;
      for(int i =1;i<=10;i++){
          if(request.getParameter("checkboxX"+i)!=null){
              checkX=true;
              break;
          }
      }
      for(int j=1;j<=6;j++){
          if(request.getParameter("checkboxR"+j)!=null){
              checkR=true;
              break;
          }
      }
      if(y==null || checkR==false || checkX==false ){
          request.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
      }else{
          request.getServletContext().getRequestDispatcher("/WEB-INF/checking").forward(request,response);
      }
    }
}
