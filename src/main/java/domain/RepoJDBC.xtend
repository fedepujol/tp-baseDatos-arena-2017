package domain

import java.sql.Connection
import java.sql.DriverManager
import java.sql.ResultSet
import java.sql.Statement

class RepoJDBC {

	// JDBC Driver nombre y direccion de la BBDD
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver"
	static final String DB_URL = "jdbc:mysql://localhost:3306/mydb"

	// Credenciales
	static final String USER = "root"
	static final String PASS = "root"

	Connection conn
	Statement stment
	ResultSet rs

	// ResultSet rs2
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
					RepositorioUnidadMedida.instance.searchById(rs.getInt("UnidadDeMedida_idUnidadDeMedida")),
					RepositorioCategoria.instance.searchById(rs.getInt("Categoria_idCategoria")),
					RepositorioSector.instance.searchById(rs.getInt("Sector_idSector")),
					rs.getDouble("Limite_Cant")
				)
			)
		}
		rs.close
		this.cerrarQuery
	}

	def revisarAlimento(Alimento unAlimento) {
		val sql = "select idAlimento, Cantidad, Descripcion, UnidadDeMedida_idUnidadDeMedida, Categoria_idCategoria from mydb.Alimento where Alimento.descripcion = '" +
			unAlimento.nombre + "';"

		var ResultSet rs3 = this.ejecutarQuery(sql)
		System.out.println("rs3.getInt(idAlimento)" + rs3.isBeforeFirst()) // rs.getInt("idAlimento"))
		if (rs3.isBeforeFirst()) {
			rs3.next()
			println("Alimento unidad " + unAlimento.unidad.id)
			println("Alimento categoria " + unAlimento.categoria.id)
			println("SQLAlimento unidad " +  rs3.getInt("UnidadDeMedida_idUnidadDeMedida"))
			println("SQLAlimento categoria " + rs3.getInt("Categoria_idCategoria"))
			
			if (rs3.getInt("UnidadDeMedida_idUnidadDeMedida") as Integer == unAlimento.unidad.id &&
				rs3.getInt("Categoria_idCategoria") as Integer == unAlimento.categoria.id) {
					
				this.updateAlimento(rs3.getInt("idAlimento"), rs3.getDouble("Cantidad"), unAlimento)
			}

		} else {

			this.insertAlimento(unAlimento)
		}
		rs3.close
		this.cerrarQuery
	}

	def updateAlimento(int unId, Double unaCantidad, Alimento unAlimento) {
		System.out.println("Entro al Update")
		val sumaCant = unaCantidad + unAlimento.cantidad
		val sql = "update Alimento set Cantidad = " + sumaCant + "where Alimento.idAlimento = '" + unId + "';"
		this.ejecutarUpdate(sql)
		this.cerrarQuery
	}

	def insertAlimento(Alimento unAlimento) {
		val sql = "insert into Alimento (Descripcion, Cantidad, UnidadDeMedida_idUnidadDeMedida, Categoria_idCategoria, Sector_idSector, Limite_Cant)
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
