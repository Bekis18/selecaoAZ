package br.com.selecao.locadora.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.URL;
import javax.persistence.*;
import javax.validation.constraints.Min;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "TB_EMPRESA")
@SequenceGenerator(name = "seq_empresa", sequenceName = "seq_empresa")
public class Empresa implements Serializable {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_empresa")
    private Long id;

    @Column(name = "RAZAO_SOCIAL", nullable = false, length = 64)
    private String razaoSocial;

    @Column(name = "CNPJ", nullable = false, unique = true, length = 32)
    @Min(value = 14, message = "CNPJ não deve ter menos que 8 dígitos")
    private String cnpj;

    @Column(name = "LOGRADOURO", length = 64)
    private String logradouro;

    @Column(name = "MUNICIPIO", length = 64)
    private String municipio;

    @Column(name = "NUMERO", length = 10)
    private String numero;

    @Column(name = "COMPLEMENTO", length = 64)
    private String complemento;

    @Column(name = "BAIRRO", length = 64)
    private String bairro;

    @Column(name = "CEP", length = 16)
    private String cep;

    @Column(name = "TELEFONE", length = 32)
    @Min(value = 9, message = "Telefone não deve ter menos que 11 dígitos")
    private String telefone;

    @Column(name = "EMAIL", nullable = false, length = 254)
    @Email (message = "Email precisa ser válido")
    private String email;

    @Column(name = "SITE", length = 254)
    @URL(protocol = "^(http|ftp).*")
    private String site;

    @Column(name = "USUARIO", nullable = false, unique = true, length = 20)
    @Min(value = 2, message = "O nome deve conter pelo menos duas letras")
    private String usuario;

    @Column(name = "SENHA", length = 128)
    private String senha;

    @Column(name = "CREATED_AT", nullable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy HH:mm:ss")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT", nullable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy HH:mm:ss")
    private LocalDateTime updatedAt;

    @JsonManagedReference
    @OneToMany(targetEntity = Comprador.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "EMPRESA", referencedColumnName = "id")
    private Collection<Comprador> comprador;

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        br.com.selecao.locadora.entity.Empresa empresa = (br.com.selecao.locadora.entity.Empresa) o;
        return getId().equals(empresa.getId());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Collection<Comprador> getComprador() {
        return comprador;
    }

    public void setComprador(Collection<Comprador> comprador) {
        this.comprador = comprador;
    }
}
