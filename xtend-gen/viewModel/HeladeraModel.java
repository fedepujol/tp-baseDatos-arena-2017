package viewModel;

import domain.Alimento;
import domain.Receta;

/* @Accessors
@Observable
 */public class HeladeraModel {
  private Alimento example /* Skipped initializer because of errors */;
  
  private Alimento alimentoSeleccionado;
  
  private Receta recetaSeleccionada;
  
  private /* List<Alimento> */Object alimentos;
  
  public HeladeraModel() {
    this.alimentoSeleccionado = null;
  }
  
  public List search() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field nombre is not visible"
      + "\nThe field cantidad is not visible"
      + "\nThe field HeladeraModel.alimentos refers to the missing type List"
      + "\nThe field Alimento.nombre refers to the missing type String"
      + "\ninstance cannot be resolved"
      + "\nsearch cannot be resolved");
  }
  
  public List clear() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field Double is undefined"
      + "\nThe constructor Alimento(String, double, UnidadMedida, Categoria) refers to the missing type String"
      + "\nThe constructor Categoria(String) refers to the missing type String"
      + "\nThe method search() from the type HeladeraModel refers to the missing type List"
      + "\nNaN cannot be resolved");
  }
  
  public double validateSearch() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field Double is undefined"
      + "\nThe field nombre is not visible"
      + "\nThe field cantidad is not visible"
      + "\nThe field Alimento.nombre refers to the missing type String"
      + "\n=== cannot be resolved"
      + "\nNaN cannot be resolved");
  }
}
