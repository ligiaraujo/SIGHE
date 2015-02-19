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
public class ReservaEsporte  { 

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
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

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public ReservaEsporte(String nome, String matricula, String horario, String tipoEsporte, String qtdBolas , String turno) {
    this.nome=nome;
    this.matricula=matricula;
    this.horario=horario;
    this.tipoEsporte=tipoEsporte;
    this.qtdBolas=qtdBolas;
    this.turno=turno;
    }
    String nome;
    String matricula;
    String horario;
    String tipoEsporte;
    String qtdBolas;
    String turno;
    
}

