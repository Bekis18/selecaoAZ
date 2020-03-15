package br.com.selecao.locadora.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.annotations.ManyToAny;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Table(name = "TB_LOTE", schema = "public")
@SequenceGenerator(name = "seq_lote", sequenceName = "seq_lote")
public class Lote implements Serializable {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_lote")
    private Long id;

    @Column(name = "NUMERO_LOTE")
    private Long numeroLote;

    @Column(name = "DESCRICAO", nullable = false, length = 60)
    private String descricao;

    @Column(name = "QUANTIDADE", nullable = false)
    private int quantidade;

    @Column(name = "VALOR_INICIAL")
    private float valorInicial;

    @Column(name = "UNIDADE", nullable = false, length = 128)
    private String unidade;

    @ManyToOne(targetEntity = Leilao.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "leilao", referencedColumnName = "id")
    private Leilao leilao;

    @Column(name = "CREATED_AT", nullable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy HH:mm:ss")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT", nullable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy HH:mm:ss")
    private LocalDateTime updatedAt;

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        br.com.selecao.locadora.entity.Lote lote = (br.com.selecao.locadora.entity.Lote) o;
        return getId().equals(lote.getId());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getNumeroLote() {
        return numeroLote;
    }

    public void setNumeroLote(Long numeroLote) {
        this.numeroLote = numeroLote;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public float getValorInicial() {
        return valorInicial;
    }

    public void setValorInicial(float valorInicial) {
        this.valorInicial = valorInicial;
    }

    public String getUnidade() {
        return unidade;
    }

    public void setUnidade(String unidade) {
        this.unidade = unidade;
    }

    public Leilao getLeilao() {
        return leilao;
    }

    public void setLeilao(Leilao leilao) {
        this.leilao = leilao;
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
}
