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
public class Refeicao 
{
    public Refeicao() {
        this.idRefeicao = "";
        this.matricula = "";
        this.tipo = "";
        this.data = "";
        this.justificativa = "";
    }

    public String getIdRefeicao() {
        return idRefeicao;
    }

    public void setIdRefeicao(String idRefeicao) {
        this.idRefeicao = idRefeicao;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getJustificativa() {
        return justificativa;
    }

    public void setJustificativa(String justificativa) {
        this.justificativa = justificativa;
    }
    
    String idRefeicao;
    String matricula;
    String tipo;
    String data;
    String justificativa;
    
}
