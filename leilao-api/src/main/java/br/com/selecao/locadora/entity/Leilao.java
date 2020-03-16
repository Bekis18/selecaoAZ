package br.com.selecao.locadora.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.validation.constraints.Min;

@Entity
@Table(name = "TB_LEILAO", schema = "public")
@SequenceGenerator(name = "seq_leilao", sequenceName = "seq_leilao")
public class Leilao implements Serializable {

    @Id
    @Column(name = "ID")
    @SequenceGenerator(name = "seq_leilao", sequenceName = "leilao_seq",
            initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_leilao")
    private Long id;

    @Column(name = "CODIGO")
    private Long codigo;

    @Column(name = "DESCRICAO", nullable = false, length = 60)
    @Min(value = 20, message = "A descrição deve conter no mínimo 20 letras")
    private String descricao;

    @Column(name = "VENDEDOR", nullable = false)
    private Long vendedor;

    @Column(name = "INICIO_PREVISTO", nullable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy HH:mm:ss")
    private LocalDateTime inicioPrevisto;

    @Column(name = "CREATED_AT", nullable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy HH:mm:ss")
    private LocalDateTime createdAt;

    @Column(name = "VALOR_TOTAL_LOTES")
    private String valorTotalLotes;

    @Column(name = "UPDATED_AT", nullable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy HH:mm:ss")
    private LocalDateTime updatedAt;

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        br.com.selecao.locadora.entity.Leilao leilao = (br.com.selecao.locadora.entity.Leilao) o;
        return id.equals(leilao.id);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Long getVendedor() {
        return vendedor;
    }

    public void setVendedor(Long vendedor) {
        this.vendedor = vendedor;
    }

    public LocalDateTime getInicioPrevisto() {
        return inicioPrevisto;
    }

    public void setInicioPrevisto(LocalDateTime inicioPrevisto) {
        this.inicioPrevisto = inicioPrevisto;
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

    @JsonManagedReference
    @OneToMany(targetEntity = Lote.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "LEILAO", referencedColumnName = "ID", updatable = false)
    private Collection<Lote> lotes;

    public Collection<Lote> getLotes() { return lotes; }

    @JsonManagedReference
    @OneToMany(targetEntity = Comprador.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "LEILAO", referencedColumnName = "ID")
    private Collection<Comprador> comprador;

    public Collection<Comprador> getComprador() {
        return comprador;
    }

    public void setComprador(Collection<Comprador> comprador) {
        this.comprador = comprador;
    }

    public String getValorTotalLotes() {
        double valor = 0;

        if(getLotes() != null) {
            Collection<Lote> lotes = getLotes();

            for (Lote lote : lotes) {
                valor += lote.getQuantidade() * lote.getValorInicial();
            }
        }

        this.valorTotalLotes = Double.toString(valor);

        return this.valorTotalLotes;
    }
}

