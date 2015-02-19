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
public class ConsultaMedica {

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

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public String getEspMed() {
        return espMed;
    }

    public void setEspMed(String espMed) {
        this.espMed = espMed;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }
    
    public ConsultaMedica (String nome, String matricula, String curso, String espMed, String horario) {
        this.nome=nome;
        this.matricula=matricula;
        this.curso=curso;
        this.espMed= espMed;
        this.horario= horario;
    }
    String nome;
    String matricula;
    String curso;
    String espMed;
    String horario;
}
