package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Local;
import utils.Conexao;

public class CompromissoController {
	public CompromissoController() {
		
	}
	
	public Local consultarByID(int id) {
		Connection con = Conexao.conectar();
		Local local = null;
    	try {
			PreparedStatement stm = con.prepareStatement("select * from tb_local where id = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			if(rs.next()) {
				local = new Local(rs.getInt("id"),rs.getString("nome"),rs.getString("rua"),rs.getInt("numero"),rs.getString("bairro"),rs.getString("cidade"),rs.getString("estado"),rs.getInt("cep"));
			}
		} catch (SQLException e) {
		   e.printStackTrace();
		}
    	return local;
	}	

}
