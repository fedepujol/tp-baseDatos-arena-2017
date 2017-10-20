package viewModel;

import domain.Alimento;
import domain.Categoria;
import domain.UnidadMedida;

/* @Observable
@Accessors
 */public class AlimentoModel {
  private Alimento alimento;
  
  private UnidadMedida unidadSeleccionada;
  
  private Categoria categoriaSeleccionada;
  
  private /* List<UnidadMedida> */Object unidades;
  
  private /* List<Categoria> */Object categorias;
  
  public AlimentoModel(final Alimento unAlimento) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field AlimentoModel.unidades refers to the missing type List"
      + "\nThe field AlimentoModel.categorias refers to the missing type List"
      + "\ninstance cannot be resolved"
      + "\nunidades cannot be resolved"
      + "\ntoList cannot be resolved"
      + "\ninstance cannot be resolved"
      + "\ncategorias cannot be resolved"
      + "\ntoList cannot be resolved");
  }
  
  public Categoria agregar() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field unidad is not visible"
      + "\nThe field categoria is not visible");
  }
  
  public java.lang.Object crear() {
    return null;
  }
}
