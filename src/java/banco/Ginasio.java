/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banco;

/**
 *
 * @author Wisley
 */
public class Ginasio {

    public Ginasio() {
        this.matricula = "";
        this.horario = "";
        this.data = "";
        this.tipoEsporte = "";
        this.qtdBolas = "";
        this.idGinasio = "";
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
    
    public String getTipoEsporte() {
        return tipoEsporte;
    }

    public void setTipoEsporte(String tipoEsporte) {
        this.tipoEsporte = tipoEsporte;
    }

    public String getQtdBolas() {
        return qtdBolas;
    }

    public void setQtdBolas(String qtdBolas) {
        this.qtdBolas = qtdBolas;
    }

    public String getIdGinasio() {
        return idGinasio;
    }

    public void setIdGinasio(String idGinasio) {
        this.idGinasio = idGinasio;
    }
    
    private String matricula;
    private String horario;
    private String data;
    private String tipoEsporte;
    private String qtdBolas;
    private String idGinasio;

}
