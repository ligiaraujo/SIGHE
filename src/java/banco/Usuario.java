/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banco;

import static com.sun.xml.bind.v2.schemagen.Util.equal;

/**
 *
 * @author Wisley
 */
public class Usuario {

    public Usuario() {
        this.idUsuario = "";
        this.tipo = "";
        this.senha = "";
        this.nome = "";
        this.matricula = "";
        this.dataNasc = "";
        this.email = "";
        this.telefone = "";
        this.cpf = "";
        this.sexo = "";
        this.curso = "";
        this.funcao = "";
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

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

    public String getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(String dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public String getFuncao() {
        return funcao;
    }

    public void setFuncao(String funcao) {
        this.funcao = funcao;
    }

    private String idUsuario;
    private String tipo;
    private String senha;
    private String nome;
    private String matricula;
    private String dataNasc;
    private String email;
    private String telefone;
    private String cpf;
    private String sexo;
    private String curso;
    private String funcao;
    
    public boolean equals(Usuario usuario) {
        if (this == usuario) {
            return true;
        }

        if (usuario instanceof Usuario) {
            Usuario that = (Usuario) usuario;
            return equal(this.tipo, that.tipo)
                    && equal(this.senha, that.senha)
                    && equal(this.nome, that.nome)
                    && equal(this.dataNasc, that.dataNasc)
                    && equal(this.email, that.email)
                    && equal(this.telefone, that.telefone)
                    && equal(this.cpf, that.cpf)
                    && equal(this.sexo, that.sexo)
                    && equal(this.curso, that.curso)
                    && equal(this.funcao, that.funcao);
        }
        return false;
    }

}
