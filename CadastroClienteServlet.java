import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CadastroClienteServlet extends HttpServlet {
  private static final String DB_URL = "jdbc:mysql://localhost:3306/nome_do_banco";
  private static final String DB_USER = "usuario";
  private static final String DB_PASSWORD = "senha";

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");

    try {
      Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
      String sql = "INSERT INTO clientes (nome, email) VALUES (?, ?)";
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setString(1, nome);
      stmt.setString(2, email);
      stmt.executeUpdate();
      stmt.close();
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }

    response.sendRedirect("sucesso.html");
  }
}
