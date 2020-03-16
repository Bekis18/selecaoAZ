package br.com.selecao.locadora.business;

import br.com.selecao.locadora.entity.Leilao;
import br.com.selecao.locadora.entity.Lote;
import br.com.selecao.locadora.repository.LeilaoRepository;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

@Service
public class LeilaoBO {

    @Autowired
    private LeilaoRepository leilaoRepository;

    public List<Leilao> buscarTodos(){
        try {
            return leilaoRepository.findAll();
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Leilao buscarPorId(Long id) {
        try {
            return leilaoRepository.findOne(id);
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Leilao inserirLeilao(Leilao leilao) {
        try {
            leilao.setCreatedAt(LocalDateTime.now());
            leilao.setUpdatedAt(LocalDateTime.now());
            return leilaoRepository.save(leilao);
        } catch (Exception e) {
            return null;
        }
    }

    public Leilao alterarLeilaoId(Long id, Leilao leilaoNovo) {
        try {
            Leilao leilaoAtual = buscarPorId(id);

            leilaoNovo.setCreatedAt(leilaoAtual.getCreatedAt());
            leilaoNovo.setUpdatedAt(LocalDateTime.now());

            return leilaoRepository.save(leilaoNovo);
        } catch (Exception e) {
            return null;
        }
    }

    public Leilao deletarPorId(Long id) {
        try {
            leilaoRepository.delete(id);
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return null;
    }
}
