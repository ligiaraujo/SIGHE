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

    public String getTipoRefeicao() {
        return tipoRefeicao;
    }

    public void setTipoRefeicao(String tipoRefeicao) {
        this.tipoRefeicao = tipoRefeicao;
    }

    public String getJustificativa() {
        return justificativa;
    }

    public void setJustificativa(String justificativa) {
        this.justificativa = justificativa;
    }
    public Refeicao (String nome, String matricula, String tipoRefeicao, String justificativa) {
        this.nome = nome;
        this.matricula = matricula;
        this.tipoRefeicao = tipoRefeicao;
        this.justificativa = justificativa;
    }
    String nome;
    String matricula;
    String tipoRefeicao;
    String justificativa;
    
}
