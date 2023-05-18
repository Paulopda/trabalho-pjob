<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");
    
    // Conectar ao banco de dados
    Connection connection = null;
    try {
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/seu_banco_de_dados", "seu_usuario", "sua_senha");
        
        // Inserir dados na tabela de clientes
        String sql = "INSERT INTO clientes (nome, email, telefone) VALUES (?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, nome);
        statement.setString(2, email);
        statement.setString(3, telefone);
        statement.executeUpdate();
        
        out.println("Cliente cadastrado com sucesso!");
    } catch (SQLException e) {
        out.println("Erro ao cadastrar cliente: " + e.getMessage());
    } finally {
        // Fechar conexão com o banco de dados
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            out.println("Erro ao fechar conexão com o banco de dados: " + e.getMessage());
        }
    }
%>
