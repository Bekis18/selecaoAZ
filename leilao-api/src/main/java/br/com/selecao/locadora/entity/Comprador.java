package br.com.selecao.locadora.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "TB_COMPRADOR")
@SequenceGenerator(name = "seq_comprador", sequenceName = "seq_comprador")
public class Comprador implements Serializable {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_comprador")
    private Long id;

    @JsonBackReference
    @ManyToOne(targetEntity = Empresa.class)
    @JoinColumn(name = "EMPRESA", referencedColumnName = "ID", nullable = false)
    private Empresa empresa;

    @JsonBackReference
    @ManyToOne(targetEntity = Leilao.class)
    @JoinColumn(name = "LEILAO", referencedColumnName = "ID", nullable = false)
    private Leilao leilao;

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        br.com.selecao.locadora.entity.Comprador comprador = (br.com.selecao.locadora.entity.Comprador) o;
        return getId().equals(comprador.getId());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Leilao getLeilao() {
        return leilao;
    }

    public Long getLeilaoId() { return getLeilao().getId(); }

    public void setLeilao(Leilao leilao) {
        this.leilao = leilao;
    }

    public Empresa getEmpresa() {
        return empresa;
    }

    public Long getEmpresaId() { return getEmpresa().getId(); }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }
}