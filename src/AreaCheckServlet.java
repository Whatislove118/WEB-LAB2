import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


public class AreaCheckServlet extends HttpServlet {
    private ServletContext context;
    private ArrayList<Point> list;

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean checkX = false, checkY=false, checkR=false;

        ArrayList<Double> arrayX = new ArrayList<Double>();
        double Y = 0;
        ArrayList<Double> arrayR = new ArrayList<Double>();
        PrintWriter printWriter = response.getWriter();
        response.setContentType("text/html");

        if (list == null) {
            list = new ArrayList<Point>();
            context.setAttribute("list", list);
        }
        try {
            printWriter.println("<!DOCTYPE html>" +
                    "<html lang='ru'>" +
                    "<head>" +
                    "<title>Response</title>" +
                    "<meta charset='utf-8' >" +
                    "</head>" +
                    "<body>"
                    );
            if(request.getParameter("checkboxX10")==null && request.getParameter("checkboxR6")==null) {
                try {
                    Y = Double.parseDouble(request.getParameter("textY").replace(',', '.').trim());
                    if (Y >= 3 || Y <= -5) {
                        printWriter.println("Y not included in odz");
                    } else {
                        checkY = true;
                    }
                } catch (NumberFormatException e) {
                    printWriter.println("Y must be a number");
                }

                for (int i = 1; i <= 10; i++) {
                    if (request.getParameter("checkboxX" + i) != null) {
                        try {
                            Double X = Double.parseDouble(request.getParameter("checkboxX" + i).replace(',', '.').trim());
                            if (X < -3 || X > 5) {
                                printWriter.println("X not included in odz");
                                continue;
                            }
                            arrayX.add(X);
                            checkX = true;
                        } catch (NumberFormatException e) {
                            printWriter.println("Х must be a number");
                        }
                    }
                }

                for (int j = 1; j <= 6; j++) {
                    if (request.getParameter("checkboxR" + j) != null) {
                        try {
                            Double R = Double.parseDouble(request.getParameter("checkboxR" + j).replace(',', '.').trim());
                            if (R < 1 || R > 5) {
                                printWriter.println("R not included in odz");
                                continue;
                            }
                            arrayR.add(R);
                            checkR = true;
                        } catch (NumberFormatException e) {
                            printWriter.println("R must be a number ");
                        }
                    }
                }
                printWriter.println("<br>");
            }else{  
                Double R = Double.parseDouble(request.getParameter("checkboxR6").replace(',', '.').trim());
                arrayR.add(R);
                Y = Double.parseDouble(request.getParameter("textY").replace(',', '.').trim());
                Double X = Double.parseDouble(request.getParameter("checkboxX10").replace(',', '.').trim());
                arrayX.add(X);
                checkR=true;
                checkX=true;
                checkY=true;
            }
            if(checkX&&checkR&&checkY){
                for(int i=0;i<arrayR.size();i++){
                    for(int j=0;j<arrayX.size();j++){
                        list.add(new Point(arrayX.get(j),Y,arrayR.get(i)));
                    }
                }

            }
            printWriter.println("<table id='result_table' align='center'>" +
                    "<tr>" +
                    "<th><h5>X</h5><hr></th>" +
                    "<th><h5>Y</h5><hr></th>" +
                    "<th><h5>R</h5><hr></th>" +
                    "<th><h5>Hit or Miss?</h5><hr></th>" +
                    "</tr>");
            for(int i = list.size()-1; i > -1; i--){
                printWriter.println("<tr>" +
                        "<td>" + list.get(i).getX() + "<hr></td>" +
                        "<td>" + list.get(i).getY() + "<hr></td>" +
                        "<td>" + list.get(i).getR() + "<hr></td>" +
                        "<td>" + (list.get(i).isProbil() ? "Hit " : "Miss") + "<hr></td>" +
                        "</tr>");
            }

            printWriter.println("</table>");

        } finally {
            printWriter.close();
        }
    }
    public class Point{
        private double x;
        private double y;

        public double getX() {
            return x;
        }

        public double getY() {
            return y;
        }

        public double getR() {
            return r;
        }

        private double r;

        public boolean isProbil() {
            return probil;
        }

        private boolean probil;

        Point(double x,double y,double r){
            this.x=x;
            this.y=y;
            this.r=r;
            checkProbil();
        }

        public void checkProbil(){
            if(this.x>0 && this.y<0){
                probil=false;
                return;
            }
            if(this.x<=0 && this.y<=0){
                probil=-this.x<=this.r/2 && -this.y<=this.r;
                return;
            }
            if(this.x<0 && this.y>=0){
                probil=Math.pow(this.x, 2) + Math.pow(this.y,2) <= Math.pow(this.r, 2);
                return;
            }
            if(this.x>=0 && this.y>=0){
                probil=this.y<=-this.x/2+this.r/2;
                return;
            }
            probil=false;

        }

    }
}

