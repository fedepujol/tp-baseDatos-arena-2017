package domain

import java.sql.Connection
import java.sql.Statement
import java.sql.ResultSet
import java.sql.DriverManager

class RepoJDBC {

	// JDBC Driver nombre y direccion de la BBDD
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver"
	static final String DB_URL = "jdbc:mysql://localhost:3306/heladera"

	// Credenciales
	static final String USER = "root"
	static final String PASS = "root"

	Connection conn
	Statement stment
	ResultSet rs

	new() {
		Class.forName(JDBC_DRIVER)
	}

	def getAlimentos() {
		val sql = "select * from Alimento"
		val rs = this.ejecutarQuery(sql)

		while (rs.next()) {
			RepositorioAlimento.instance.create(
				new Alimento(
					rs.getString("Descripcion"),
					rs.getDouble("Cantidad"),
					RepositorioUnidadMedida.instance.searchById(rs.getInt("Unidad De Medida_idUnidad De Medida")),
					RepositorioCategoria.instance.searchById(rs.getInt("Categoria_idCategoria")),
					RepositorioSector.instance.searchById(rs.getInt("Sector_idSector")),
					rs.getDouble("LimiteCantidad")
				)
			)
		}
		rs.close
		this.cerrarQuery
	}

	def insertAlimento(Alimento unAlimento) {
		val sql = "insert into Alimento (Descripcion, Cantidad, Unidad_De_Medida_idUnidad, Categoria_idCategoria, Sector_idSector, LimiteCantidad)
					values ('" + unAlimento.nombre + "'" + ", " + unAlimento.cantidad + ", " + unAlimento.unidad.id +
			", " + unAlimento.categoria.id + ", " + unAlimento.sector.id + ", " + unAlimento.cantidadMinima + ");"
		this.ejecutarUpdate(sql)
		this.cerrarQuery
	}

	def cerrarQuery() {
		conn.close
		stment.close
	}

	def ejecutarUpdate(String sqlQuery) {
		conn = DriverManager.getConnection(DB_URL, USER, PASS)
		stment = conn.createStatement()
		stment.executeUpdate(sqlQuery)
	}

	def ejecutarQuery(String sqlQuery) {
		conn = DriverManager.getConnection(DB_URL, USER, PASS)
		stment = conn.createStatement()
		rs = stment.executeQuery(sqlQuery)
	}
}
